/******************************************************************************
*
* Copyright (C) 2017 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
******************************************************************************
File Name       : df_video_setdispfmt.c
Version           :
Author            :
Created           : 2017/08/17
Description      : CNcomment: 设置输出显示制式CNend\n
Function List    :
History            :
Date                        Author                  Modification
2017/08/17             sdk
******************************************************************************/


/*********************************add include here******************************/
#include <stdio.h>
#include <stdlib.h>

#include <math.h>
#include <unistd.h>
#include <directfb.h>
#include <sys/time.h>

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



#define MAIN_ENCODER 0

/*************************** Structure Definition *********************************/
typedef struct _timings {
    char *description;
    DFBScreenEncoderConfig encoder_config;
} Timings;


/********************** Global Variable declaration ********************************/

static Timings timings[] =
{
  {
    "3840x2160p@60Hz",
    {
      .flags = DSECONF_TV_STANDARD | DSECONF_SCANMODE | DSECONF_RESOLUTION | DSECONF_FREQUENCY,
      .tv_standard = DSETV_DIGITAL,
      .frequency   = DSEF_60HZ,
      .scanmode    = DSESM_PROGRESSIVE,
      .resolution  = DSOR_3840_2160
    }
  },
  {
    "1920x1080p@60Hz",
    {
      .flags = DSECONF_TV_STANDARD | DSECONF_SCANMODE | DSECONF_RESOLUTION | DSECONF_FREQUENCY,
      .tv_standard = DSETV_DIGITAL,
      .frequency   = DSEF_60HZ,
      .scanmode    = DSESM_PROGRESSIVE,
      .resolution  = DSOR_1920_1080
    }
  },
  {
    "1920x1080i@60Hz",
    {
      .flags = DSECONF_TV_STANDARD | DSECONF_SCANMODE | DSECONF_RESOLUTION | DSECONF_FREQUENCY,
      .tv_standard = DSETV_DIGITAL,
      .frequency   = DSEF_60HZ,
      .scanmode    = DSESM_INTERLACED,
      .resolution  = DSOR_1920_1080
    }
  },
  {
    "1280x720p@60Hz",
    {
      .flags = DSECONF_TV_STANDARD | DSECONF_SCANMODE | DSECONF_RESOLUTION | DSECONF_FREQUENCY,
      .tv_standard = DSETV_DIGITAL,
      .frequency   = DSEF_60HZ,
      .scanmode    = DSESM_PROGRESSIVE,
      .resolution  = DSOR_1280_720
    }
  },
  {
    "720x480p@60Hz",
    {
      .flags = DSECONF_TV_STANDARD | DSECONF_SCANMODE | DSECONF_RESOLUTION | DSECONF_FREQUENCY,
      .tv_standard = DSETV_DIGITAL,
      .frequency   = DSEF_60HZ,
      .scanmode    = DSESM_PROGRESSIVE,
      .resolution  = DSOR_720_480,
    }
  },
  {
    "720x480i@60Hz",
    {
      .flags = DSECONF_TV_STANDARD | DSECONF_SCANMODE | DSECONF_RESOLUTION | DSECONF_FREQUENCY,
      .tv_standard = DSETV_DIGITAL,
      .frequency   = DSEF_60HZ,
      .scanmode    = DSESM_INTERLACED,
      .resolution  = DSOR_720_480
    }
  }
};

/******************************* API forward declarations *************************/

/******************************* API realization *********************************/
int main( int argc, char **argv )
{
    DFBResult err;
    IDirectFB *dfb = NULL;
    IDirectFBScreen *screen = NULL;
    DFBScreenID screen_id = DSCID_PRIMARY;
    DFBScreenEncoderConfig initial_encoder_config;
    int k = 0;

#ifndef CONFIG_GFX_DFB_OPTV5_SUPPORT
    return 0;
#endif

    /* init and get main interface */
    DFBCHECK(DirectFBInit(&argc, &argv));
    DFBCHECK(DirectFBCreate(&dfb));

    /* Get the screen with which this video layer is associated */
    //SAMPLE_TRACE("++++++++++++ get screen id\n");
    DFBCHECK(dfb->GetScreen(dfb, screen_id, &screen));

    //SAMPLE_TRACE("++++++++++++ get disp fmt\n");
    DFBCHECK( screen->GetEncoderConfiguration(screen, MAIN_ENCODER, &initial_encoder_config));

    //SAMPLE_TRACE("++++++++++++ screen id %d\n",screen_id);

    for (k = 0; k < sizeof timings / sizeof timings[0]; k++)
    {
        int screen_width, screen_height;

        SAMPLE_TRACE( "about to set mode to %s\n", timings[k].description );

        DFBCHECK( screen->SetEncoderConfiguration( screen, MAIN_ENCODER, &timings[k].encoder_config ) );
        DFBCHECK( screen->GetSize( screen, &screen_width, &screen_height ) );
        SAMPLE_TRACE( "screen is %dx%d\n", screen_width, screen_height );

        {
            IDirectFBDisplayLayer *layer = NULL;
            IDirectFBSurface *surface = NULL;
            int w, h;

            DFBCHECK(dfb->GetDisplayLayer( dfb, DLID_PRIMARY, &layer ) );
            DFBCHECK(layer->SetCooperativeLevel( layer, DLSCL_ADMINISTRATIVE ) );
            DFBCHECK(layer->GetSurface( layer, &surface ) );
            DFBCHECK(surface->GetSize( surface, &w, &h ) );

            SAMPLE_TRACE( "primary display layer surface dimensions: "
                          "\033[32m"
                          "%dx%d"
                          "\033[0m"
                          "\n",
                          w, h );

            DFBCHECK(surface->Release(surface));
            DFBCHECK(layer->Release(layer));
        }

        getchar();
    }

    SAMPLE_TRACE("++++++++++++ set default disp fmt\n");
    initial_encoder_config.flags = DSECONF_TV_STANDARD | DSECONF_SCANMODE | DSECONF_RESOLUTION | DSECONF_FREQUENCY;
    DFBCHECK(screen->SetEncoderConfiguration( screen, MAIN_ENCODER, &initial_encoder_config));


    /* release screen interface */
    DFBCHECK( screen->Release( screen ) );

    /* release the dfb main interface */
    DFBCHECK( dfb->Release( dfb ) );

    return 0;
}

