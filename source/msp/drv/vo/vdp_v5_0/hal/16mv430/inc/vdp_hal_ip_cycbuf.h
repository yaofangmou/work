#ifndef __VDP_HAL_IP_CYCBUF_H__
#define __VDP_HAL_IP_CYCBUF_H__

#include "hi_type.h"

HI_VOID VDP_CYCBUF_SetDtvCfgAddr(  HI_U32 offset, HI_U32 dtv_cfg_addr      );
HI_VOID VDP_CYCBUF_SetWriteReady(  HI_U32 offset, HI_U32 write_ready       );
HI_VOID VDP_CYCBUF_SetIndex( HI_U32 offset, HI_U32 index);
HI_VOID VDP_CYCBUF_SetAddrMode( HI_U32 offset, HI_U32 u32AddrMode);
HI_VOID VDP_CYCBUF_SetBtmTaskTyp( HI_U32 offset, HI_U32 btm_task_typ);
HI_VOID VDP_CYCBUF_SetTopTaskTyp( HI_U32 offset, HI_U32 top_task_typ);
HI_VOID VDP_CYCBUF_SetBtmDispNum(  HI_U32 offset, HI_U32 btm_disp_num      );
HI_VOID VDP_CYCBUF_SetTopDispNum(  HI_U32 offset, HI_U32 top_disp_num      );
HI_VOID VDP_CYCBUF_SetFirstFieldSel(  HI_U32 offset, HI_U32 first_field_sel   );
HI_VOID VDP_CYCBUF_SetOnOffMode( HI_U32 offset, HI_U32 on_off_mode);
HI_VOID VDP_CYCBUF_SetResetEn(  HI_U32 offset, HI_U32 reset_en          );
HI_VOID VDP_CYCBUF_SetResetMode(  HI_U32 offset, HI_U32 reset_mode        );
HI_VOID VDP_CYCBUF_SetRegup(  HI_U32 offset, HI_U32 regup             );
HI_VOID VDP_CYCBUF_SetDtvMode(  HI_U32 offset, HI_U32 dtv_mode          );
HI_VOID VDP_CYCBUF_SetBackMode( HI_U32 offset, HI_U32 back_mode);
HI_VOID VDP_CYCBUF_SetHburstNum(  HI_U32 offset, HI_U32 hburst_num        );
HI_VOID VDP_CYCBUF_SetLburstNum(  HI_U32 offset, HI_U32 lburst_num        );
HI_VOID VDP_CYCBUF_SetVid0SuccEn(  HI_U32 offset, HI_U32 vid0_succ_en      );
HI_VOID VDP_CYCBUF_SetVid0BindEn(  HI_U32 offset, HI_U32 vid0_bind_en      );
HI_VOID VDP_CYCBUF_SetDtvBackPassword(  HI_U32 offset, HI_U32 dtv_back_password );

HI_U32  VDP_CYCBUF_GetBackErr(  HI_U32 offset);
HI_U32  VDP_CYCBUF_GetDtvBackAddr(  HI_U32 offset);
HI_U32  VDP_CYCBUF_GetBackNum(  HI_U32 offset);
HI_U32 VDP_CYCBUF_GetUnderloadSta( HI_U32 offset);
HI_U32 VDP_CYCBUF_GetUnderloadCnt( HI_U32 offset);
HI_U32  VDP_CYCBUF_GetDispCurIdex( HI_U32 offset);
HI_VOID VDP_CYCBUF_ClearUnloadFlag( HI_U32 offset);
HI_U32  VDP_CYCBUF_GetDtvDispAddr(  HI_U32 offset);
HI_VOID VDP_CYCBUF_GetResetEn( HI_U32 offset, HI_BOOL *preset_en);
HI_U32  VDP_CYCBUF_GetSendErr(  HI_U32 offset);
HI_U32  VDP_CYCBUF_GetDtvCfgAddr(  HI_U32 offset);

#endif
