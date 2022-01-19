/******************************************************************************
*
* Copyright (C) 2017 Hisilicon Technologies Co., Ltd.  All rights reserved.
*
* This program is confidential and proprietary to Hisilicon  Technologies Co., Ltd. (Hisilicon),
* and may not be copied, reproduced, modified, disclosed to others, published or used, in
* whole or in part, without the express prior written permission of Hisilicon.
*
******************************************************************************
File Name        : hisi_dfb_opentv5_layer.c
Version          : Initial Draft
Author           :
Created          : 2017/07/05
Description      : control hard decode dispose
Function List    :


History          :
Date                      Author                    Modification
2017/07/05                sdk                       Created file
******************************************************************************/

/****************************  add include here     *******************************/
#include <config.h>
#include <asm/types.h>
#include <stdio.h>
#include <sys/mman.h>
#include <directfb.h>
#include <direct/debug.h>
#include <direct/messages.h>
#include <sys/ioctl.h>
#include <fbdev/fbdev.h>
#include <core/layers.h>

#include "hi_mpi_disp.h"
#include "hi_unf_vo.h"
#include "hi_mpi_win.h"
#include "hi_mpi_hdmi.h"

/***************************** Macro Definition     *******************************/


/***************************** Structure Definition *******************************/
typedef struct
{
    int level;
    DFBRectangle source;
}VideoLayerData;

/********************** Global Variable declaration *******************************/
static int gs_LayerLevel[4] = {1, -1, 2, -2};
static int layer_id = 0;

/********************** API forward declarations    ********************************/

/**********************       API realization       ***********************************/

static int video_layerdata_size( void )
{
    return sizeof(VideoLayerData);
}

static DFBResult video_init_layer (CoreLayer                  *layer,
                                   void                       *driver_data,
                                   void                       *layer_data,
                                   DFBDisplayLayerDescription *description,
                                   DFBDisplayLayerConfig      *config,
                                   DFBColorAdjustment         *adjustment )
{
    VideoLayerData *data = (VideoLayerData *)layer_data;

    if ((NULL == data))
    {
        D_ERROR("[%s:%d]%p, %p, %p\n", __func__, __LINE__, data, layer, layer->shared);
        return DFB_FAILURE;
    }

    if (layer_id >= sizeof(gs_LayerLevel) / sizeof(gs_LayerLevel[0]))
    {
        D_ERROR("[%s:%d]%d\n", __func__, __LINE__, layer_id);
        return DFB_FAILURE;
    }

    if (HI_SUCCESS != HI_UNF_VO_Init(HI_UNF_VO_DEV_MODE_NORMAL))
    {
        D_ERROR("+++ WARNING HI_MPI_WIN_Init Failure\n");
        return DFB_OK;
    }

    description->caps = DLCAPS_SCREEN_LOCATION | DLCAPS_LEVELS | DLCAPS_OPACITY | DLCAPS_SURFACE;
    description->type = DLTF_VIDEO | DLTF_STILL_PICTURE;

    /** set name **/
    snprintf(description->name, DFB_DISPLAY_LAYER_DESC_NAME_LENGTH, "HISI Video");

    /** fill out the default configuration **/
    config->flags      = DLCONF_WIDTH | DLCONF_HEIGHT | DLCONF_BUFFERMODE;
    config->buffermode = DLBM_FRONTONLY;
    config->width      = 1920;
    config->height     = 1080;
    config->pixelformat = DSPF_ARGB;

    data->level = gs_LayerLevel[layer_id++];
    data->source.x = 0;
    data->source.y = 0;
    data->source.w = 1920;
    data->source.h = 1080;

    return DFB_OK;
}

static DFBResult video_shuttdown_layer(CoreLayer    *layer,
                                       void         *driver_data,
                                       void         *layer_data)
{
    HI_UNF_VO_DeInit();

    layer_id--;

    return DFB_OK;
}

static DFBResult video_get_winid(CoreLayer                  *layer, HI_HANDLE *hWin)
{
    if ((NULL == layer) || (NULL == layer->shared) || (NULL == hWin))
    {
        D_ERROR("+++ WARNING %s->%d, !layer %d, !layer->shared:%d,Cannot get window handle!\n", __func__, __LINE__, !layer, !layer->shared);
        return DFB_FAILURE;
    }

    if (2 == layer->shared->layer_id)
    {
        *hWin = (HI_HANDLE)((HI_ID_VO << 16) | (HI_UNF_DISPLAY1 << 8)  | (0x0));
    }
    else if (4 == layer->shared->layer_id)
    {
        *hWin = (HI_HANDLE)((HI_ID_VO << 16) | (HI_UNF_DISPLAY1 << 8)  | (0x1));
    }
    else
    {
        /*layer 1 and layer 3 -----Fake layer*/
        return DFB_FAILURE;
    }

    return DFB_OK;
}

static DFBResult video_set_region(CoreLayer                  *layer,
                                  void                       *driver_data,
                                  void                       *layer_data,
                                  void                       *region_data,
                                  CoreLayerRegionConfig      *config,
                                  CoreLayerRegionConfigFlags  updated,
                                  CoreSurface                *surface,
                                  CorePalette                *palette,
                                  CoreSurfaceBufferLock      *left_lock,
                                  CoreSurfaceBufferLock      *right_lock )
{
    HI_UNF_WINDOW_ATTR_S attr;
    HI_HANDLE win;
    int ret;
    HI_U32 opacity;
    VideoLayerData *data = (VideoLayerData *)layer_data;

    if (!config || !data)
    {
        return DFB_OK;
    }

    ret = video_get_winid(layer, &win);
    if (ret != DFB_OK)
    {
        return DFB_OK;
    }

    if (HI_SUCCESS != HI_UNF_VO_GetWindowAttr(win,  &attr))
    {
        D_ERROR("+++ WARNING HI_UNF_VO_GetWindowAttr Failure\n");
        return DFB_OK;
    }

    if (updated & CLRCF_SOURCE)
    {
        attr.stInputRect.s32X       = config->source.x;
        attr.stInputRect.s32Y       = config->source.y;
        if (data->source.w != config->source.w)
        { 
            attr.stInputRect.s32Width   = config->source.w;
        }
        if (data->source.h != config->source.h)
        {
            attr.stInputRect.s32Height  = config->source.h;
        }
        memcpy(&data->source, &config->source, sizeof(DFBRectangle));
    }

    if (updated & CLRCF_DEST)
    {
        attr.stOutputRect.s32X      = config->dest.x;
        attr.stOutputRect.s32Y      = config->dest.y;
        attr.stOutputRect.s32Width  = config->dest.w;
        attr.stOutputRect.s32Height = config->dest.h;
    }


    if (HI_SUCCESS != HI_UNF_VO_SetWindowAttr(win, &attr))
    {
        D_ERROR("+++ WARNING HI_UNF_VO_SetWindowAttr Failure\n");
        return DFB_OK;
    }

    if (updated & CLRCF_OPACITY)
    {
        opacity = (config->opacity == 0xff) ? 100 : 0;

        if (HI_SUCCESS != HI_UNF_VO_SetWindowAlpha(win, opacity))
        {
            D_ERROR("+++ WARNING Set Opacity Failure\n");
            return DFB_OK;
        }
    }

    return DFB_OK;
}


static DFBResult video_test_region(CoreLayer                   *layer,
                                   void                       *driver_data,
                                   void                       *layer_data,
                                   CoreLayerRegionConfig      *config,
                                   CoreLayerRegionConfigFlags *failed )
{
    return DFB_OK;
}

static DFBResult video_get_level(CoreLayer *layer, void *driver_data, void *layer_data, int *level)
{
    VideoLayerData *data = (VideoLayerData *)layer_data;

    if ((NULL == level) || (NULL == data))
    {
        return DFB_FAILURE;
    }

    *level = data->level;

    return DFB_OK;
}

static DFBResult video_set_level(CoreLayer *layer, void *driver_data, void *layer_data, int level)
{
    HI_S32 Ret = HI_SUCCESS;
    HI_HANDLE win;
    VideoLayerData *data = (VideoLayerData *)layer_data;

    if (NULL == data)
    {
        return DFB_FAILURE;
    }

    if (level == data->level)
    {
        return DFB_OK;
    }

    /*Only record level*/
    if ((level >= 0) || (data->level >= 0))
    {
        data->level = level;
        return DFB_OK;
    }

    Ret = video_get_winid(layer, &win);
    if (Ret != DFB_OK)
    {
        return DFB_FAILURE;
    }

    if (level < data->level)
    {
        Ret = HI_UNF_VO_SetWindowZorder(win, HI_LAYER_ZORDER_MOVEBOTTOM);
    }
    else
    {
        Ret = HI_UNF_VO_SetWindowZorder(win, HI_LAYER_ZORDER_MOVETOP);
    }

    if (HI_SUCCESS != Ret)
    {
        D_ERROR("+++ WARNING Set level Fail,ret:0x%x!\n", Ret);
        return DFB_FAILURE;
    }

    data->level = level;

    return DFB_OK;
}


static DFBResult video_set_color_adjustment(CoreLayer *layer, void *driver_data, void *layer_data, DFBColorAdjustment *adjustment)
{
    //D_ERROR("+++ WARNING Set color adjustment can not support\n");
    return DFB_OK;
}

static
DFBResult video_flip_region( CoreLayer                  *layer,
                                 void                       *driver_data,
                                 void                       *layer_data,
                                 void                       *region_data,
                                 CoreSurface                *surface,
                                 DFBSurfaceFlipFlags         flags,
                                 const DFBRegion            *left_update,
                                 CoreSurfaceBufferLock      *left_lock,
                                 const DFBRegion            *right_update,
                                 CoreSurfaceBufferLock      *right_lock )
{
    return DFB_OK;
}

static DFBResult fake_init_layer(CoreLayer                  *layer,
                                 void                       *driver_data,
                                 void                       *layer_data,
                                 DFBDisplayLayerDescription *description,
                                 DFBDisplayLayerConfig      *config,
                                 DFBColorAdjustment         *adjustment )
{
    VideoLayerData *data = (VideoLayerData *)layer_data;

    if (NULL == data)
    {
        D_ERROR("[%s:%d]%p, %p, %p\n", __func__, __LINE__, data, layer, layer->shared);
        return DFB_FAILURE;
    }

    if (layer_id >= sizeof(gs_LayerLevel) / sizeof(gs_LayerLevel[0]))
    {
        D_ERROR("[%s:%d]%d\n", __func__, __LINE__, layer_id);
        return DFB_FAILURE;
    }

    description->caps = DLCAPS_NONE;
    description->type = DLTF_NONE;

    snprintf(description->name, DFB_DISPLAY_LAYER_DESC_NAME_LENGTH, "HISI Placeholder");

    config->flags = DLCONF_NONE;

    data->level = gs_LayerLevel[layer_id++];

    return DFB_OK;
}


static DFBResult fake_shuttdown_layer(CoreLayer *layer,
                                      void      *driver_data,
                                      void      *layer_data)
{
    return DFB_OK;
}


static DFBResult fake_test_region(CoreLayer                  *layer,
                                  void                       *driver_data,
                                  void                       *layer_data,
                                  CoreLayerRegionConfig      *config,
                                  CoreLayerRegionConfigFlags *failed )
{
    return DFB_OK;
}


static DFBResult fake_set_region(CoreLayer                  *layer,
                                 void                       *driver_data,
                                 void                       *layer_data,
                                 void                       *region_data,
                                 CoreLayerRegionConfig      *config,
                                 CoreLayerRegionConfigFlags  updated,
                                 CoreSurface                *surface,
                                 CorePalette                *palette,
                                 CoreSurfaceBufferLock      *lock_left,
                                 CoreSurfaceBufferLock      *lock_right )
{
    return DFB_OK;
}


static DisplayLayerFuncs fake_layer_funcs =
{
    .LayerDataSize = video_layerdata_size,
    .InitLayer     = fake_init_layer,
    .ShutdownLayer = fake_shuttdown_layer,
    .TestRegion    = fake_test_region,
    .SetRegion     = fake_set_region
};

static DisplayLayerFuncs video_layer_funcs =
{
    .LayerDataSize = video_layerdata_size,
    .InitLayer     = video_init_layer,
    .ShutdownLayer = video_shuttdown_layer,
    .TestRegion    = video_test_region,
    .SetRegion     = video_set_region,
    .GetLevel      = video_get_level,
    .SetLevel      = video_set_level,
    .SetColorAdjustment = video_set_color_adjustment,
    .FlipRegion = video_flip_region,
};
