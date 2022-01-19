#define LOG_TAG "Drm"
#include <utils/Logger.h>
#include <dlfcn.h>

#include "SharedLibrary.h"

#define DRM_MAX_PATH (1024)

static bool bIsNagraLib = false;
SharedLibrary::SharedLibrary(const String8& path)
{
    mLibHandle = NULL;
    HI_CHAR filePath[DRM_MAX_PATH + 1] = {0};
    HI_U32 filePathLen = strlen(path.string());

    if (filePathLen == 0 || filePathLen >= DRM_MAX_PATH)
    {
        HI_LOGE("File path length: %d is too long!", filePathLen);
        return;
    }

    if (NULL == realpath(path.string(), filePath))
    {
        HI_LOGE("File path%s not exist!", path.string());
        return;
    }

    mLibHandle = dlopen(filePath, RTLD_NOW);
    if (NULL == mLibHandle)
    {
        HI_LOGE("%s open fail, error:%s!", filePath, dlerror());
    }

    bIsNagraLib = path.contains("nagra");
    HI_LOGD("<<<SharedLibrary %s bIsNagraLib=%d \n",path.string(),bIsNagraLib);
}

SharedLibrary::~SharedLibrary()
{
    if (mLibHandle != NULL)
    {
        HI_LOGD("<<<~SharedLibrary  in\n");
        if(bIsNagraLib != true )
        {
            dlclose(mLibHandle);
            mLibHandle = NULL;
        }
        else
        {
            HI_LOGE("<<<~SharedLibrary  bIsNagraLib=true can not close it\n");
        }
    }
}

HI_BOOL SharedLibrary::operator!() const
{
    return (mLibHandle == NULL) ? HI_TRUE : HI_FALSE;
}

void* SharedLibrary::lookup(const HI_CHAR* symbol) const
{
    if (!mLibHandle || !symbol)
    {
        return NULL;
    }

    return dlsym(mLibHandle, symbol);
}

const HI_CHAR* SharedLibrary::lastError() const
{
    const HI_CHAR* error = dlerror();
    return error ? error : "No errors or unknown error";
}
