/******************************************************************************

  Copyright (C), 2014-2024, Hisilicon Tech. Co., Ltd.

******************************************************************************
  File Name     : OsdManager.h
  Version       : Initial Draft
  Author        : Hisilicon multimedia software group
  Created       : 2014/02/18
  Description   :
  History       :
  1.Date        : 2014/02/18
  Author        :
  Modification  : Created file

******************************************************************************/

#include <stdint.h>
#include <inttypes.h>
#include <sys/inotify.h>
#include <sys/poll.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <math.h>
#include <fcntl.h>
#include <utils/misc.h>
#include <signal.h>
#include <time.h>

//OpenGLES
#include <GLES/gl.h>
#include <GLES/glext.h>

#include "OsdManager.h"
#include <utils/Log.h>


#include "font/OsdText.h"

namespace android {

// ---------------------------------------------------------------------------
#define FONT_PATH       "/system/fonts/DroidSans.ttf"
#define SAMPLE_BITMAP   "/sdcard/background.bmp"


enum{
    RGBA32  = 32,
    RGB24   = 24,
    YUV420SP= 40
};

OsdManager::OsdManager()
{
    ALOGD("[%4d] %s",__LINE__,__func__);
    mContext=NULL;
    mSession = new SurfaceComposerClient();
}

OsdManager::~OsdManager()
{
    ALOGD("[%4d] %s",__LINE__,__func__);
    if (mSession != NULL)
    {
        mSession->dispose();
        mSession.clear();
    }
}

//create 2 surface, sideband surface, OSDSurface
HI_S32 OsdManager::CreateSurface(SURFACE_ATTR_S *pstAttr, HI_HANDLE *phSurface)
{
    if (mContext!=NULL)
    {
        ALOGE("%d CreateSurface: Surface Already created ",__LINE__);
        return NO_ERROR;
    }

    ALOGD("[%4d] %s",__LINE__,__func__);

    //get display info
    sp<IBinder> dtoken(SurfaceComposerClient::getBuiltInDisplay(ISurfaceComposer::eDisplayIdMain));
    DisplayInfo dinfo;
    status_t status = SurfaceComposerClient::getDisplayInfo(dtoken, &dinfo);
    if (status)
    {
        ALOGE("[%4d] %s Cann't get display info",__LINE__,__func__);
        return UNKNOWN_ERROR;
    }

    ALOGD("[%4d] %s [%4d x %4d]",__LINE__,__func__,dinfo.w,dinfo.h);

    //Video sideband, create the native surface
    sp<SurfaceControl> spVideoControl  = mSession->createSurface(String8("OsdManagerVideo"), dinfo.w, dinfo.h, PIXEL_FORMAT_RGBA_8888);
    sp<SurfaceControl> spOsdControl    = mSession->createSurface(String8("OsdManagergraphics"), dinfo.w, dinfo.h, PIXEL_FORMAT_RGBA_8888);
    //Alternated method
    //sp<SurfaceControl> control = session()->createSurface( String8("OsdManagerVideo"), pstAttr->u32Width, pstAttr->u32Height, pstAttr->s32PixelFormat);
    ALOGD("[%4d] %s [%4d x %4d]",__LINE__,__func__,dinfo.w,dinfo.h);

    //set layer and show
    SurfaceComposerClient::openGlobalTransaction();
    spVideoControl->setLayer(0x40000000);
    spVideoControl->show();
    spOsdControl->setLayer(0x40000002);
    spOsdControl->show();
    SurfaceComposerClient::closeGlobalTransaction();
    ALOGD("[%4d] %s [%4d x %4d]",__LINE__,__func__,dinfo.w,dinfo.h);

    sp<Surface> spVideoSurface = spVideoControl->getSurface();
    sp<Surface> spOsdSurface   = spOsdControl->getSurface();

    ANativeWindow   *window = spVideoSurface.get();
    //s->setAsyncMode(true);

    ALOGD("[%4d] %s",__LINE__,__func__);

    //disconnect before set sideband
    int err = native_window_api_disconnect(window, NATIVE_WINDOW_API_EGL);
    if (err != NO_ERROR)
    {
        ALOGE("[%4d] %s native_window_api_disconnect: %s (%d)",__LINE__,__func__, strerror(-err), -err);
    }

    //set sideband
    native_handle_t* pstSideBandHandle = NULL;
    pstSideBandHandle = native_handle_create(0, 1);
    pstSideBandHandle->data[0] = HI_NULL;
    native_window_set_sideband_stream(window, pstSideBandHandle);

    err = native_window_api_connect(window, NATIVE_WINDOW_API_EGL);
    if (err != NO_ERROR)
    {
        ALOGE("[%4d] %s native_window_api_connect: %s (%d)",__LINE__,__func__, strerror(-err), -err);
    }
    native_handle_delete(pstSideBandHandle);


    // initialize opengl and egl, transparent
    const EGLint attribs[] = {
            EGL_RED_SIZE,   8,
            EGL_GREEN_SIZE, 8,
            EGL_BLUE_SIZE,  8,
            EGL_ALPHA_SIZE, 8, //MUST in O, Option in K
//            EGL_DEPTH_SIZE, 8,
            EGL_NONE
    };
    EGLint w, h, dummy;
    EGLint numConfigs;
    EGLConfig config;
    EGLContext context;
    ALOGD("[%4d] %s",__LINE__,__func__);

    EGLDisplay display = eglGetDisplay(EGL_DEFAULT_DISPLAY);

    eglInitialize(display, 0, 0);
    eglChooseConfig(display, attribs, &config, 1, &numConfigs);

    //create 2nd surface
    EGLSurface eglOsdSurface;
    eglOsdSurface = eglCreateWindowSurface(display, config, spOsdSurface.get(), NULL);
    context = eglCreateContext(display, config, NULL, NULL);
    eglQuerySurface(display, eglOsdSurface, EGL_WIDTH, &w);
    eglQuerySurface(display, eglOsdSurface, EGL_HEIGHT, &h);

    if (eglMakeCurrent(display, eglOsdSurface, eglOsdSurface, context) == EGL_FALSE)
    {
        ALOGE("[%4d] %s",__LINE__,__func__);
        return NO_INIT;
    }


    mDisplay = display;
    mContext = context;
    mWidth = w;
    mHeight = h;

    mFlingerSurfaceControl = spVideoControl;
    mFlingerSurface = spVideoSurface;

    mOSDSurface = eglOsdSurface;
    mFlingerSurfaceControl2 = spOsdControl;
    mFlingerSurface2 = spOsdSurface;

    //this->ClearSurface(NULL);
    //this->android();
//*/
    ALOGD("[%4d] %s",__LINE__,__func__);

    return NO_ERROR;
}


//DestroySurface BootAnimation::Threadloop
HI_S32 OsdManager::DestroySurface(HI_HANDLE hSurface)
{
    ALOGD("[%4d] %s",__LINE__,__func__);
    eglMakeCurrent(mDisplay, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT);
    eglDestroyContext(mDisplay, mContext);
    eglDestroySurface(mDisplay, mSidebandSurface);
    mFlingerSurface.clear();
    mFlingerSurfaceControl.clear();

    eglDestroySurface(mDisplay, mOSDSurface);
    mFlingerSurface2.clear();
    mFlingerSurfaceControl2.clear();

    eglTerminate(mDisplay);
    //IPCThreadState::self()->stopProcess();

    return NO_ERROR;
};


//ClearSurface
HI_S32 OsdManager::ClearSurface(HI_HANDLE hSurface)
{
    ALOGD("[%4d] %s",__LINE__,__func__);

    //clear screen
    glShadeModel(GL_FLAT);
    glDisable(GL_DITHER);
    glDisable(GL_SCISSOR_TEST);
    glClearColor(0, 0, 0, 0);
    glClear(GL_COLOR_BUFFER_BIT);

    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    eglSwapBuffers(mDisplay, mOSDSurface);

    return NO_ERROR;
}


//fill an rectangle use specified color
HI_S32 OsdManager::FillRect(HI_HANDLE hSurface, HI_RECT_S *pstRect, HI_U32 u32Color)
{

    ALOGD("[%4d] %s",__LINE__,__func__);

    int x=pstRect->s32X,y=pstRect->s32Y,w=pstRect->s32Width , h=pstRect->s32Height;

    char* bits = NULL;
    bits = (char*)malloc(w*h*4);

    //FIXME for Debug
    //u32Color=0xff0000ff;

    //set color RGBA [0-255]
    unsigned char R=u32Color>>24&0xff;
    unsigned char G=u32Color>>16&0xff;
    unsigned char B=u32Color>>8 &0xff;
    unsigned char A=u32Color    &0xff;

    for(int i=0; i<w*h; i++)
    {
            bits[i*4+0]=R;
            bits[i*4+1]=G;
            bits[i*4+2]=B;
            bits[i*4+3]=A;
    }


    ALOGD("[%4d] %s point_0_RGBA[%d-%d-%d-%d]",__LINE__,__func__,bits[0],bits[1],bits[2],bits[3]);

    glEnable(GL_TEXTURE_2D);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

    //Upload the texture
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, w, h, 0, GL_RGBA, GL_UNSIGNED_BYTE, bits);
    //draw it
    glDrawTexiOES(x, y, 0, w, h);

    free(bits);
    bits=NULL;

    //eglSwapBuffers(mDisplay, mOSDSurface);
    show();

    return NO_ERROR;
}





HI_S32 OsdManager::GetCCTextSize(HI_CHAR* pTest,HI_S32 *pWidth, HI_S32 *pHeigh )
{
    ALOGD("[%4d] %s",__LINE__,__func__);

    *pWidth = strlen(pTest);
    *pHeigh = 21;
    ALOGD("[%4d] %s size(%dx%d)", __LINE__, __func__, *pWidth, *pHeigh);

    return HI_SUCCESS;
}

HI_S32 OsdManager::DrawCCText(HI_HANDLE hSurface, SURFACE_ATTR_S * pstSurfaceAttr ,HI_RECT_S *pstRect, HI_CHAR *pText,CCTEXT_ATTR_S * pstAttr)
{
    ALOGD("[%4d] %s",__LINE__,__func__);

    DrawText(hSurface, pstRect, 0x00ffffff, pText);

    return HI_SUCCESS;
}

HI_S32 OsdManager::TeletextDrawBitmap(HI_HANDLE hSurface, HI_U8 *bitmapBuffer,HI_RECT_S *pstSrcRect,HI_RECT_S *pstDstRect)
{
    ALOGD("[%4d] %s",__LINE__,__func__);
    DrawBMP(hSurface, bitmapBuffer, pstSrcRect, pstDstRect, RGBA32);

    return HI_SUCCESS;
}

HI_S32 OsdManager::SubDrawBitmap(HI_HANDLE hSurface, HI_U8 *pu8BitmapBuffer,SURFACE_ATTR_S * pstSurfaceAttr ,HI_RECT_S *pstSrcRect)
{
    ALOGD("[%4d] %s",__LINE__,__func__);
    DrawBMP(hSurface, pu8BitmapBuffer, pstSrcRect, pstSrcRect, RGBA32);

    return HI_SUCCESS;
}

HI_S32 OsdManager::FillCCRect(HI_HANDLE hSurface,SURFACE_ATTR_S * pstSurfaceAttr, HI_RECT_S *pstRect, HI_U32 u32Color)
{
    ALOGD("[%4d] %s",__LINE__,__func__);
    FillRect(hSurface, pstRect, u32Color);

    return HI_SUCCESS;
}
HI_S32 OsdManager::BlitFrameToSurface(HI_UNF_VIDEO_FRAME_INFO_S *pstFrame,HI_HANDLE hDstSurface, HI_RECT_S *pstDstRect)
{
    ALOGD("[%4d] %s",__LINE__,__func__);
    HI_RECT_S stSrcRect={0,0,(int)pstFrame->u32Width,(int)pstFrame->u32Height};

    DrawBMP(hDstSurface, (HI_U8 *)pstFrame->stVideoFrameAddr[0].u32YAddr, &stSrcRect, pstDstRect, YUV420SP);

    return HI_SUCCESS;
}

// ---------------------------------------------------------------------------
void OsdManager::show()
{
    eglSwapBuffers(mDisplay, mOSDSurface);
}






// ---------------------------------------------------------------------------
/*
reference: Loadbitmap
    https://blog.csdn.net/hero9881010love/article/details/38515117
*/

typedef struct tagImage{
    GLubyte *imageData;
    GLuint  bpp;
    GLuint  width;
    GLuint  height;
}TAGImage;

// bmp file headerdefine.
typedef struct tagBITMAPFILEHEADER{
    unsigned short bfType;
    unsigned int   bfSize;
    unsigned short bfReserved1;
    unsigned short bfReserved2;
    unsigned int   bfOffBits;
}__attribute__((packed)) BITMAPFILEHEADER;

// bmp info header define.
typedef struct tagBITMAPINFOHEADER{
    unsigned int biSize;
    int biWidth;
    int biHeight;
    unsigned short biPlanes;
    unsigned short biBitCount;
    unsigned int   biCompression;
    unsigned int   biSizeImage;
    int  biXPelsPerMeter;
    int  biYpelsPerMeter;
    unsigned int biClrUsed;
    unsigned int biClrImportant;
}__attribute__((packed)) BITMAPINFOHEADER;

void loadBmpFile(const char *filename, TAGImage* pTexture)
{
    BITMAPFILEHEADER bmpFileHeader;//bmp file header.
    BITMAPINFOHEADER bmpInfoHeader;//bmp info header.
    GLuint imageSize;
    GLuint temp;
    GLuint type = GL_RGB;

    FILE  *file = fopen(filename,"rb");
    if(file == NULL){
        return ;
    }

    int n =-1;
    n= fread(&bmpFileHeader,1,sizeof(BITMAPFILEHEADER),file);//read file head.
    if(bmpFileHeader.bfType != 0x4d42)
        return ;

    n=fread(&bmpInfoHeader,1,sizeof(BITMAPINFOHEADER),file);//read file info.

    pTexture->width  = bmpInfoHeader.biWidth;// image width.
    pTexture->height = bmpInfoHeader.biHeight;//image height.
    pTexture->bpp    = bmpInfoHeader.biBitCount;//bit depth.
    imageSize        = bmpInfoHeader.biSizeImage;//image  size.

    ALOGD("picture info: %dx%d@%d, size:%d\n", pTexture->width, pTexture->height, pTexture->bpp, imageSize);

    if(pTexture->width <=0 ||
    pTexture->height<=0 ||
        pTexture->bpp != 24)
    {
        fclose(file);
        return ;
    }

  //get true size.
    fseek(file,0,SEEK_END);
    int total_size = ftell(file);
    // jump to the real image data pos.
    fseek(file,bmpFileHeader.bfOffBits,SEEK_SET);
    int curr_size = ftell(file);
    imageSize = total_size - curr_size;

    pTexture->imageData = (GLubyte *)malloc(imageSize);
    //check the memory exists or match filememory size.
    if(pTexture->imageData == NULL ||
        fread(pTexture->imageData,1,imageSize,file) != imageSize)
    {
        if(pTexture->imageData != NULL)
            free(pTexture->imageData);

        fclose(file);
        return ;
    }

    //loop image data,swaps R B.
    for(GLuint i = 0 ; i < imageSize; i += 3){
        temp = pTexture->imageData[i];
        pTexture->imageData[i]   = pTexture->imageData[i+2];
        pTexture->imageData[i+2] = temp;
    }

    //finish read bmp file.
    fclose(file);

    ALOGD("[%4d]%s  finish all the file read,begin draw image.\n",__LINE__,__func__);
}


//draw a bitmap, BMP support 24bit,32bit,YUV420SP
HI_S32 OsdManager::DrawBMP(HI_HANDLE hSurface, HI_U8 *bitmapBuffer,HI_RECT_S *pstSrcRect,HI_RECT_S *pstDstRect, int colortype)

{
    ALOGD("[%4d] %s %dx%d -->%d,%d,%dx%d",__LINE__,__func__, pstSrcRect->s32Width, pstSrcRect->s32Height, pstDstRect->s32X, pstDstRect->s32Y, pstDstRect->s32Width, pstSrcRect->s32Height);

    TAGImage texture;

    //FIXME for Debug
    if (NULL==bitmapBuffer)
    {
        loadBmpFile(SAMPLE_BITMAP, &texture);
    }else{
        texture.imageData = bitmapBuffer;
        texture.width  = pstSrcRect->s32Width;
        texture.height = pstSrcRect->s32Height;
        texture.bpp = RGB24;
        ALOGD("[%4d] %s",__LINE__,__func__);
    }

    glEnable(GL_TEXTURE_2D);

    GLuint texHandle = 0;

    GLuint  w = texture.width;
    GLuint  h = texture.height;

    glGenTextures(1, &texHandle);
    glBindTexture(GL_TEXTURE_2D, texHandle);
    switch(texture.bpp)
    {
        case RGB24:
            glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, w, h, 0, GL_RGB, GL_UNSIGNED_BYTE, texture.imageData);
            break;
        case RGBA32:
            glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, w, h, 0, GL_RGBA, GL_UNSIGNED_BYTE, texture.imageData);
            break;
        case YUV420SP:
            glTexImage2D(GL_TEXTURE_2D, 0, GL_LUMINANCE, w, h, 0, GL_LUMINANCE, GL_UNSIGNED_BYTE, texture.imageData);
            break;
        default:
            //glTexImage2D(GL_TEXTURE_2D, 0, GL_ALPHA, w, h, 0, GL_ALPHA, GL_UNSIGNED_BYTE, texture.imageData);
            break;
    }

    GLint crop[4] = { 0, (GLint)(-h), (GLint)(w), (GLint)(h) };
    glTexParameteriv(GL_TEXTURE_2D, GL_TEXTURE_CROP_RECT_OES, crop);
    glTexParameterx(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
    glTexParameterx(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_NEAREST);

    glTexParameterx(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameterx(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    glDrawTexiOES(pstDstRect->s32X, pstDstRect->s32Y, 0, pstDstRect->s32Width, pstDstRect->s32Height);

    //clean up
    glDeleteTextures(1,&texHandle);

    if (NULL==bitmapBuffer)
    {
        if(texture.imageData != 0)
        {
            free(texture.imageData);
            texture.imageData = NULL;
        }
    }

    //eglSwapBuffers(mDisplay, mOSDSurface);

    return NO_ERROR;
}


HI_S32 OsdManager::DrawText(HI_HANDLE hSurface, HI_RECT_S *pstRect, HI_U32 u32Color, HI_CHAR *pText)
{
    //set color RGBA [0-255]
    float R = (u32Color>>24&0xff)/256.0;
    float G = (u32Color>>16&0xff)/256.0;
    float B = (u32Color>>8 &0xff)/256.0;
    float A = (u32Color    &0xff)/256.0;
    int fontsize = 50;

    OSDText* p = new OSDText();

    //rotation,scacle,...
    p->postInit(FONT_PATH, mWidth, mHeight);

    glColor4f(R,G,B,A);//color

    ALOGD("[%4d] %s pos(%d,%d),size:%d,colorRGBA(%2.1f,%2.1f,%2.1f,%2.1f) Text:%s",__LINE__,__func__,pstRect->s32X, pstRect->s32Y,fontsize,R,G,B,A,pText);

    p->drawText(p->font, pText, pstRect->s32X, pstRect->s32Y,fontsize);
    delete p;

    //eglSwapBuffers(mDisplay, mOSDSurface);

    return HI_SUCCESS;
}

#include "videoframe2jpg.c"

// ---------------------------------------------------------------------------

}; // namespace android
