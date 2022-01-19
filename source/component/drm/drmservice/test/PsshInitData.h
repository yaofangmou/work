//
// Copyright 2014 Google Inc. All Rights Reserved.
//
#ifndef MEDIADRM_TESTS_PSSH_INIT_DATA_H_
#define MEDIADRM_TESTS_PSSH_INIT_DATA_H_

// This data was captured by playing 'oops_cenc' in the YouTube Dash MSE demo with PlayReady CDM.
// http://dash-mse-test.appspot.com/dash-player.html
const uint8_t kPsshInitData[] = {
    0x00, 0x00, 0x00, 0x34, 0x70, 0x73, 0x73, 0x68, 0x00, 0x00, 0x00, 0x00, 0xed, 0xef, 0x8b, 0xa9,
    0x79, 0xd6, 0x4a, 0xce, 0xa3, 0xc8, 0x27, 0xdc, 0xd5, 0x1d, 0x21, 0xed, 0x00, 0x00, 0x00, 0x14,
    0x08, 0x01, 0x12, 0x10, 0x93, 0x78, 0x99, 0x20, 0xe8, 0xd6, 0x52, 0x00, 0x98, 0x57, 0x7d, 0xf8,
    0xf2, 0xdd, 0x55, 0x46, 0x00, 0x00, 0x02, 0xf4, 0x70, 0x73, 0x73, 0x68, 0x00, 0x00, 0x00, 0x00,
    0x9a, 0x04, 0xf0, 0x79, 0x98, 0x40, 0x42, 0x86, 0xab, 0x92, 0xe6, 0x5b, 0xe0, 0x88, 0x5f, 0x95,
    0x00, 0x00, 0x02, 0xd4, 0xd4, 0x02, 0x00, 0x00, 0x01, 0x00, 0x01, 0x00, 0xca, 0x02, 0x3c, 0x00,
    0x57, 0x00, 0x52, 0x00, 0x4d, 0x00, 0x48, 0x00, 0x45, 0x00, 0x41, 0x00, 0x44, 0x00, 0x45, 0x00,
    0x52, 0x00, 0x20, 0x00, 0x78, 0x00, 0x6d, 0x00, 0x6c, 0x00, 0x6e, 0x00, 0x73, 0x00, 0x3d, 0x00,
    0x22, 0x00, 0x68, 0x00, 0x74, 0x00, 0x74, 0x00, 0x70, 0x00, 0x3a, 0x00, 0x2f, 0x00, 0x2f, 0x00,
    0x73, 0x00, 0x63, 0x00, 0x68, 0x00, 0x65, 0x00, 0x6d, 0x00, 0x61, 0x00, 0x73, 0x00, 0x2e, 0x00,
    0x6d, 0x00, 0x69, 0x00, 0x63, 0x00, 0x72, 0x00, 0x6f, 0x00, 0x73, 0x00, 0x6f, 0x00, 0x66, 0x00,
    0x74, 0x00, 0x2e, 0x00, 0x63, 0x00, 0x6f, 0x00, 0x6d, 0x00, 0x2f, 0x00, 0x44, 0x00, 0x52, 0x00,
    0x4d, 0x00, 0x2f, 0x00, 0x32, 0x00, 0x30, 0x00, 0x30, 0x00, 0x37, 0x00, 0x2f, 0x00, 0x30, 0x00,
    0x33, 0x00, 0x2f, 0x00, 0x50, 0x00, 0x6c, 0x00, 0x61, 0x00, 0x79, 0x00, 0x52, 0x00, 0x65, 0x00,
    0x61, 0x00, 0x64, 0x00, 0x79, 0x00, 0x48, 0x00, 0x65, 0x00, 0x61, 0x00, 0x64, 0x00, 0x65, 0x00,
    0x72, 0x00, 0x22, 0x00, 0x20, 0x00, 0x76, 0x00, 0x65, 0x00, 0x72, 0x00, 0x73, 0x00, 0x69, 0x00,
    0x6f, 0x00, 0x6e, 0x00, 0x3d, 0x00, 0x22, 0x00, 0x34, 0x00, 0x2e, 0x00, 0x30, 0x00, 0x2e, 0x00,
    0x30, 0x00, 0x2e, 0x00, 0x30, 0x00, 0x22, 0x00, 0x3e, 0x00, 0x3c, 0x00, 0x44, 0x00, 0x41, 0x00,
    0x54, 0x00, 0x41, 0x00, 0x3e, 0x00, 0x3c, 0x00, 0x50, 0x00, 0x52, 0x00, 0x4f, 0x00, 0x54, 0x00,
    0x45, 0x00, 0x43, 0x00, 0x54, 0x00, 0x49, 0x00, 0x4e, 0x00, 0x46, 0x00, 0x4f, 0x00, 0x3e, 0x00,
    0x3c, 0x00, 0x4b, 0x00, 0x45, 0x00, 0x59, 0x00, 0x4c, 0x00, 0x45, 0x00, 0x4e, 0x00, 0x3e, 0x00,
    0x31, 0x00, 0x36, 0x00, 0x3c, 0x00, 0x2f, 0x00, 0x4b, 0x00, 0x45, 0x00, 0x59, 0x00, 0x4c, 0x00,
    0x45, 0x00, 0x4e, 0x00, 0x3e, 0x00, 0x3c, 0x00, 0x41, 0x00, 0x4c, 0x00, 0x47, 0x00, 0x49, 0x00,
    0x44, 0x00, 0x3e, 0x00, 0x41, 0x00, 0x45, 0x00, 0x53, 0x00, 0x43, 0x00, 0x54, 0x00, 0x52, 0x00,
    0x3c, 0x00, 0x2f, 0x00, 0x41, 0x00, 0x4c, 0x00, 0x47, 0x00, 0x49, 0x00, 0x44, 0x00, 0x3e, 0x00,
    0x3c, 0x00, 0x2f, 0x00, 0x50, 0x00, 0x52, 0x00, 0x4f, 0x00, 0x54, 0x00, 0x45, 0x00, 0x43, 0x00,
    0x54, 0x00, 0x49, 0x00, 0x4e, 0x00, 0x46, 0x00, 0x4f, 0x00, 0x3e, 0x00, 0x3c, 0x00, 0x4b, 0x00,
    0x49, 0x00, 0x44, 0x00, 0x3e, 0x00, 0x49, 0x00, 0x4a, 0x00, 0x6c, 0x00, 0x34, 0x00, 0x6b, 0x00,
    0x39, 0x00, 0x62, 0x00, 0x6f, 0x00, 0x41, 0x00, 0x46, 0x00, 0x4b, 0x00, 0x59, 0x00, 0x56, 0x00,
    0x33, 0x00, 0x33, 0x00, 0x34, 0x00, 0x38, 0x00, 0x74, 0x00, 0x31, 0x00, 0x56, 0x00, 0x52, 0x00,
    0x67, 0x00, 0x3d, 0x00, 0x3d, 0x00, 0x3c, 0x00, 0x2f, 0x00, 0x4b, 0x00, 0x49, 0x00, 0x44, 0x00,
    0x3e, 0x00, 0x3c, 0x00, 0x43, 0x00, 0x48, 0x00, 0x45, 0x00, 0x43, 0x00, 0x4b, 0x00, 0x53, 0x00,
    0x55, 0x00, 0x4d, 0x00, 0x3e, 0x00, 0x49, 0x00, 0x65, 0x00, 0x71, 0x00, 0x38, 0x00, 0x4c, 0x00,
    0x36, 0x00, 0x48, 0x00, 0x79, 0x00, 0x4b, 0x00, 0x4d, 0x00, 0x59, 0x00, 0x3d, 0x00, 0x3c, 0x00,
    0x2f, 0x00, 0x43, 0x00, 0x48, 0x00, 0x45, 0x00, 0x43, 0x00, 0x4b, 0x00, 0x53, 0x00, 0x55, 0x00,
    0x4d, 0x00, 0x3e, 0x00, 0x3c, 0x00, 0x4c, 0x00, 0x41, 0x00, 0x5f, 0x00, 0x55, 0x00, 0x52, 0x00,
    0x4c, 0x00, 0x3e, 0x00, 0x68, 0x00, 0x74, 0x00, 0x74, 0x00, 0x70, 0x00, 0x73, 0x00, 0x3a, 0x00,
    0x2f, 0x00, 0x2f, 0x00, 0x77, 0x00, 0x77, 0x00, 0x77, 0x00, 0x2e, 0x00, 0x79, 0x00, 0x6f, 0x00,
    0x75, 0x00, 0x74, 0x00, 0x75, 0x00, 0x62, 0x00, 0x65, 0x00, 0x2e, 0x00, 0x63, 0x00, 0x6f, 0x00,
    0x6d, 0x00, 0x2f, 0x00, 0x61, 0x00, 0x70, 0x00, 0x69, 0x00, 0x2f, 0x00, 0x64, 0x00, 0x72, 0x00,
    0x6d, 0x00, 0x2f, 0x00, 0x70, 0x00, 0x6c, 0x00, 0x61, 0x00, 0x79, 0x00, 0x72, 0x00, 0x65, 0x00,
    0x61, 0x00, 0x64, 0x00, 0x79, 0x00, 0x3f, 0x00, 0x73, 0x00, 0x6f, 0x00, 0x75, 0x00, 0x72, 0x00,
    0x63, 0x00, 0x65, 0x00, 0x3d, 0x00, 0x59, 0x00, 0x4f, 0x00, 0x55, 0x00, 0x54, 0x00, 0x55, 0x00,
    0x42, 0x00, 0x45, 0x00, 0x26, 0x00, 0x61, 0x00, 0x6d, 0x00, 0x70, 0x00, 0x3b, 0x00, 0x76, 0x00,
    0x69, 0x00, 0x64, 0x00, 0x65, 0x00, 0x6f, 0x00, 0x5f, 0x00, 0x69, 0x00, 0x64, 0x00, 0x3d, 0x00,
    0x30, 0x00, 0x33, 0x00, 0x36, 0x00, 0x38, 0x00, 0x31, 0x00, 0x32, 0x00, 0x36, 0x00, 0x32, 0x00,
    0x64, 0x00, 0x63, 0x00, 0x34, 0x00, 0x31, 0x00, 0x32, 0x00, 0x63, 0x00, 0x30, 0x00, 0x36, 0x00,
    0x3c, 0x00, 0x2f, 0x00, 0x4c, 0x00, 0x41, 0x00, 0x5f, 0x00, 0x55, 0x00, 0x52, 0x00, 0x4c, 0x00,
    0x3e, 0x00, 0x3c, 0x00, 0x2f, 0x00, 0x44, 0x00, 0x41, 0x00, 0x54, 0x00, 0x41, 0x00, 0x3e, 0x00,
    0x3c, 0x00, 0x2f, 0x00, 0x57, 0x00, 0x52, 0x00, 0x4d, 0x00, 0x48, 0x00, 0x45, 0x00, 0x41, 0x00,
    0x44, 0x00, 0x45, 0x00, 0x52, 0x00, 0x3e, 0x00, 0x00, 0x00, 0x00, 0x30, 0x70, 0x73, 0x73, 0x68,
    0x00, 0x00, 0x00, 0x00, 0x58, 0x14, 0x7e, 0xc8, 0x04, 0x23, 0x46, 0x59, 0x92, 0xe6, 0xf5, 0x2c,
    0x5c, 0xe8, 0xc3, 0xcc, 0x00, 0x00, 0x00, 0x10, 0x93, 0x78, 0x99, 0x20, 0xe8, 0xd6, 0x52, 0x00,
    0x98, 0x57, 0x7d, 0xf8, 0xf2, 0xdd, 0x55, 0x46,
};

#endif  // MEDIADRM_TESTS_PSSH_INIT_DATA_H_
