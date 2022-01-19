/*
 * Copyright (C) 2017 The Android Open Source Project
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use, copy,
 * modify, merge, publish, distribute, sublicense, and/or sell copies
 * of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
 * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

#include "avb_ops_user.h"

#include <errno.h>
/*
#include <fcntl.h>   //Hisi Modify Here
#include <linux/fs.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
*/

#include <common.h>
#include <exports.h>
#include <hi_flash.h>
#include <libavb_ab/libavb_ab.h>
#include <avb_config.h>

#define PUBLIC_KEY_LENGTH (512)
#define SSA_BYTEALIGN(u32DataSize, u32AlignSize) (((u32DataSize) + (u32AlignSize) - 1) & (~((u32AlignSize) - 1)))

extern HI_S32 ssaLoadHashDescImage(char *PartitionName, HI_U8* address, HI_U64 size);

static AvbIOResult read_from_partition(AvbOps* ops,
                                       const char* partition,
                                       int64_t offset,
                                       size_t num_bytes,
                                       void* buffer,
                                       size_t* out_num_read) {
  AVB_LOGD("Enter\n");                     

  HI_U32 u32ReadOffset = 0;
  HI_U32 u32ReadLength = 0;

  HI_HANDLE fd = 0;
  HI_Flash_InterInfo_S flashInfo;
  HI_S32 num_read = 0;
  AvbIOResult ret = AVB_IO_RESULT_OK;
  HI_U8 * tempBuf = NULL;

  AVB_LOGD("read_from_partition partition:%s\n",partition);
  fd = HI_Flash_OpenByName((char* )partition);
  if (INVALID_FD == fd) {
    AVB_LOGE("HI_Flash_OpenByName error partition:%s;offset:%lld;num_bytes:%d\n",partition,offset,num_bytes);
    ret = AVB_IO_RESULT_ERROR_NO_SUCH_PARTITION;
    goto out;
  }

  if(HI_FAILURE == HI_Flash_GetInfo(fd, &flashInfo))
  {
    AVB_LOGE("HI_Flash_GetInfo error partition:%s;offset:%lld;num_bytes:%d\n",partition,offset,num_bytes);
    ret = AVB_IO_RESULT_ERROR_NO_SUCH_PARTITION;
    goto out;
  }

  if(offset < 0)
  {
    offset = flashInfo.PartSize - (-offset);
    AVB_LOGD("read_from_partition offset:%lld\n",offset);
  }

  //num_bytes = num_bytes > (flashInfo.PartSize - offset) ? (flashInfo.PartSize - offset) : num_bytes;
  AVB_LOGD("read_from_partition BlockSize:%d\n",flashInfo.BlockSize);
  AVB_LOGD("read_from_partition PageSize:%d\n",flashInfo.PageSize);

  u32ReadOffset = SSA_BYTEALIGN(offset,flashInfo.BlockSize);
  u32ReadOffset = u32ReadOffset > offset ? (u32ReadOffset - flashInfo.BlockSize):u32ReadOffset;
  u32ReadLength = num_bytes + offset - u32ReadOffset;

  AVB_LOGD("read_from_partition u32ReadOffset:%d\n",u32ReadOffset);
  AVB_LOGD("read_from_partition u32ReadLength:%d\n",u32ReadLength);

  tempBuf = (HI_U8*)avb_malloc_(u32ReadLength);
  if(NULL == tempBuf)
  {
    AVB_LOGE("avb_malloc_ error u32ReadLength:%d\n",u32ReadLength);
    ret = AVB_IO_RESULT_ERROR_IO;
    goto out;
  }

  num_read = HI_Flash_Read(fd, u32ReadOffset, tempBuf, u32ReadLength, HI_FLASH_RW_FLAG_RAW);
  if (num_read == -1) {
    AVB_LOGE("HI_Flash_Read error u32ReadOffset:%d,u32ReadLength:%d\n",u32ReadOffset,u32ReadLength);
    avb_free(tempBuf);
    ret = AVB_IO_RESULT_ERROR_IO;
    goto out;
  }

  avb_memcpy(buffer,tempBuf + offset - u32ReadOffset,num_bytes);

  if (out_num_read != NULL) {
    *out_num_read = num_bytes;
  }

  ret = AVB_IO_RESULT_OK;

out:
  if (fd != INVALID_FD) {
    if (HI_SUCCESS != HI_Flash_Close(fd)) {
      avb_error("Error closing file descriptor.\n");
    }
  }
  if(NULL != tempBuf)
  {
    avb_free(tempBuf);
  }
  return ret;
}

AvbIOResult get_preloaded_partition(AvbOps* ops,
                                         const char* partition,
                                         size_t num_bytes,
                                         uint8_t** out_pointer,
                                         size_t* out_num_bytes_preloaded)
{
    AvbIOResult ret = AVB_IO_RESULT_OK;
    HI_S32 s32Ret = HI_FAILURE;

    AVB_LOGD("get_preloaded_partition:%s.\n",partition);
    if(0 == avb_memcmp(partition,SSA_PARTNAME_KERNEL,4))
    {
        if(0 == avb_memcmp(partition,"boot_a",6)
            || 0 == avb_memcmp(partition,"boot_b",6))
        {
            s32Ret = ssaLoadHashDescImage((char*)partition,SSA_VERIFY_ADDR_KERNEL,SSA_VERIFY_SIZE_KERNEL);
            if (HI_SUCCESS != s32Ret)
            {
                return AVB_IO_RESULT_ERROR_IO;
            }
        }

        if(num_bytes < SSA_VERIFY_SIZE_KERNEL)
        {
            * out_pointer = SSA_VERIFY_ADDR_KERNEL;
            *out_num_bytes_preloaded = num_bytes;
            ret = AVB_IO_RESULT_OK;
        }
        else
        {
            * out_pointer = NULL;
            *out_num_bytes_preloaded = 0;
            ret = AVB_IO_RESULT_ERROR_IO;
        }
    }
    else if(0 == avb_memcmp(partition,SSA_PARTNAME_TEEOS,11))
    {
        if(num_bytes < SSA_VERIFY_SIZE_TEEOS)
        {
            * out_pointer = SSA_VERIFY_ADDR_TEEOS;
            *out_num_bytes_preloaded = num_bytes;
            ret = AVB_IO_RESULT_OK;
        }
        else
        {
            * out_pointer = NULL;
            *out_num_bytes_preloaded = 0;
            ret = AVB_IO_RESULT_ERROR_IO;
        }
    }
    else
    {
        * out_pointer = NULL;
        *out_num_bytes_preloaded = 0;
        AVB_LOGE("Error get_preloaded_partition:%s.\n",partition);
        ret = AVB_IO_RESULT_ERROR_IO;
    }

    return ret;
}

static AvbIOResult write_to_partition(AvbOps* ops,
                                      const char* partition,
                                      int64_t offset,
                                      size_t num_bytes,
                                      const void* buffer) {
  HI_HANDLE fd = INVALID_FD;
  AvbIOResult ret = AVB_IO_RESULT_OK;
  HI_S32 s32ret = 0;

  AVB_LOGD("write_to_partition partition:%s\n",partition);

  fd = HI_Flash_OpenByName((char*)partition);
  if (INVALID_FD == fd) {
    AVB_LOGE("HI_Flash_OpenByName failed partition:%s",partition);
    ret = AVB_IO_RESULT_ERROR_NO_SUCH_PARTITION;
    goto out;
  }

  s32ret = HI_Flash_Write(fd, offset,(HI_U8 *)buffer, num_bytes, HI_FLASH_RW_FLAG_RAW);
  if (HI_FAILURE == s32ret) {
    AVB_LOGE("HI_Flash_Write failed ret:%d",s32ret);
    AVB_LOGE("partition:%s,offset:%lld,num_bytes:%d\n",partition,offset,num_bytes);
    ret = AVB_IO_RESULT_ERROR_IO;
    goto out;
  }

  ret = AVB_IO_RESULT_OK;
  AVB_LOGD("write_to_partition ret:OK\n");
out:
  if (fd != INVALID_FD) {
    if (HI_SUCCESS != HI_Flash_Close(fd)) {
      avb_error("Error closing file descriptor.\n");
    }
  }
  return ret;
}

#if 0//for debug dump
static void dump_hex(const HI_CHAR* name, const HI_U8* vector, HI_U32 length)
{
    HI_U32 i = 0;

    if (vector == NULL || name == NULL) {
        return;
    }

    printf("\nname:%s length:%d \n", name,length);

    // TODO(fredgc): replace with HEXEncode.
    for (i = 0; i < length; i++) {
        if(i%16 == 0)
            printf("\n");
        printf("0x%02x ", vector[i]);
    }
    printf("\n");
}
#endif

static AvbIOResult validate_vbmeta_public_key(
    AvbOps* ops,
    const uint8_t* public_key_data,
    size_t public_key_length,
    const uint8_t* public_key_metadata,
    size_t public_key_metadata_length,
    bool* out_is_trusted) {
    AvbIOResult ret = AVB_IO_RESULT_OK;
    uint8_t extern_public_key[PUBLIC_KEY_LENGTH] = {0};
    size_t extern_public_key_length = 0;
    uint8_t extern_public_key_N[PUBLIC_KEY_LENGTH/2] = {0};
    uint32_t extern_public_key_E = 0;
    uint64_t offset = 0;

    //dump_hex("public_key_data", public_key_data, public_key_length);
    //dump_hex("public_key_metadata", public_key_metadata, public_key_metadata_length);

#ifdef CHIP_TYPE_hi3796mv200
    offset = 0x10000; //for hi3796mv200, read from the offset 0x10000
#endif

    if (NULL == out_is_trusted) {
      *out_is_trusted = false;
    } else {
        ret = read_from_partition(ops,"fastboot", offset, PUBLIC_KEY_LENGTH,
                            extern_public_key, &extern_public_key_length);
        if (AVB_IO_RESULT_OK != ret) {
            AVB_LOGE("read_from_partition fail\n");
            *out_is_trusted = false;
            return ret;
        }
        //dump_hex("extern_public_key", extern_public_key, extern_public_key_length);

        memcpy(extern_public_key_N, extern_public_key, PUBLIC_KEY_LENGTH/2);
        extern_public_key_E = (extern_public_key[PUBLIC_KEY_LENGTH - 4] << 24)
                               + (extern_public_key[PUBLIC_KEY_LENGTH - 3] << 16)
                               + (extern_public_key[PUBLIC_KEY_LENGTH - 2] << 8)
                               + extern_public_key[PUBLIC_KEY_LENGTH - 1];
        AVB_LOGD("extern_public_key_E = 0x%x\n", extern_public_key_E);

        if (0 == memcmp(public_key_data + sizeof(AvbRSAPublicKeyHeader), extern_public_key_N, sizeof(extern_public_key_N))
            && 0x10001 == extern_public_key_E) {
            *out_is_trusted = true;
            AVB_LOGD("public key is trusted\n");
        }
        else
        {
            *out_is_trusted = false;
            AVB_LOGE("public key is not trusted\n");
        }
    }

    return AVB_IO_RESULT_OK;
}

static AvbIOResult read_rollback_index(AvbOps* ops,
                                       size_t rollback_index_location,
                                       uint64_t* out_rollback_index) {
  AVB_LOGD("Enter\n");
  if (out_rollback_index != NULL) {
    *out_rollback_index = 0;
  }
  return AVB_IO_RESULT_OK;
}

static AvbIOResult write_rollback_index(AvbOps* ops,
                                        size_t rollback_index_location,
                                        uint64_t rollback_index) {
  AVB_LOGD("Enter\n");
  return AVB_IO_RESULT_OK;
}

static AvbIOResult read_is_device_unlocked(AvbOps* ops, bool* out_is_unlocked) {
  AVB_LOGD("Enter\n");
  *out_is_unlocked = false;    //Only support for Locked

  return AVB_IO_RESULT_OK;
}

static AvbIOResult get_size_of_partition(AvbOps* ops,
                                         const char* partition,
                                         uint64_t* out_size_in_bytes) {
    AvbIOResult ret = AVB_IO_RESULT_OK;
    HI_HANDLE fd = 0;
    HI_Flash_InterInfo_S flashInfo;
	AVB_LOGD("Enter\n");
    AVB_LOGD("read_from_partition partition:%s\n",partition);

    fd = HI_Flash_OpenByName((char*)partition);
    if (INVALID_FD == fd) {
        ret = AVB_IO_RESULT_ERROR_NO_SUCH_PARTITION;
        goto out;
    }

    if(HI_FAILURE == HI_Flash_GetInfo(fd, &flashInfo))
    {
        ret = AVB_IO_RESULT_ERROR_NO_SUCH_PARTITION;
        goto out;
    }

    *out_size_in_bytes = flashInfo.PartSize;
    AVB_LOGD("out_size_in_bytes:%lld\n", *out_size_in_bytes);
    ret = AVB_IO_RESULT_OK;

out:
  if (fd != INVALID_FD) {
    if (HI_SUCCESS != HI_Flash_Close(fd)) {
      avb_error("Error closing file descriptor.\n");
    }
  }

  return ret;
}

static AvbIOResult get_unique_guid_for_partition(AvbOps* ops,
                                                 const char* partition,
                                                 char* guid_buf,
                                                 size_t guid_buf_size) {
  AVB_LOGD("Enter\n");

  if (guid_buf != NULL && guid_buf_size > 0) {
    guid_buf[0] = '\0';
  }
  return AVB_IO_RESULT_OK;
}

AvbOps* avb_ops_user_new(void) {
  AvbOps* ops;
  AVB_LOGD("Enter\n");

  ops = (AvbOps*)avb_malloc(sizeof(AvbOps));
  if (ops == NULL) {
    avb_error("Error allocating memory for AvbOps.\n");
    goto out;
  }

  ops->ab_ops = (AvbABOps*)malloc(sizeof(AvbABOps));
  if (ops->ab_ops == NULL) {
    avb_error("Error allocating memory for AvbABOps.\n");
    avb_free(ops);
    goto out;
  }
  ops->ab_ops->ops = ops;

  ops->read_from_partition = read_from_partition;
  ops->get_preloaded_partition = get_preloaded_partition;
  ops->write_to_partition = write_to_partition;
  ops->validate_vbmeta_public_key = validate_vbmeta_public_key;
  ops->read_rollback_index = read_rollback_index;
  ops->write_rollback_index = write_rollback_index;
  ops->read_is_device_unlocked = read_is_device_unlocked;
  ops->get_unique_guid_for_partition = get_unique_guid_for_partition;
  ops->get_size_of_partition = get_size_of_partition;
  ops->ab_ops->read_ab_metadata = avb_ab_data_read;
  ops->ab_ops->write_ab_metadata = avb_ab_data_write;

out:
  return ops;
}

void avb_ops_user_free(AvbOps* ops) {
  AVB_LOGD("Enter\n");

  avb_free(ops->ab_ops);
  avb_free(ops);
}
