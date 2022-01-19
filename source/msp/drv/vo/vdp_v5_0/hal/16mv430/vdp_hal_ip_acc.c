
#include "vdp_hal_ip_acc.h"
#include "vdp_hal_comm.h"


extern volatile S_VDP_REGS_TYPE* pVdpReg;

HI_VOID VDP_XDP_ACC_SetAccEn(HI_U32 acc_en)
{
    U_VHDACCTHD1 VHDACCTHD1;

    VHDACCTHD1.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCTHD1.u32));
    VHDACCTHD1.bits.acc_en = acc_en;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCTHD1.u32),VHDACCTHD1.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetAccMode(HI_U32 acc_mode)
{
    U_VHDACCTHD1 VHDACCTHD1;

    VHDACCTHD1.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCTHD1.u32));
    VHDACCTHD1.bits.acc_mode = acc_mode;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCTHD1.u32),VHDACCTHD1.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetThdMedLow(HI_U32 thd_med_low)
{
    U_VHDACCTHD1 VHDACCTHD1;

    VHDACCTHD1.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCTHD1.u32));
    VHDACCTHD1.bits.thd_med_low = thd_med_low;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCTHD1.u32),VHDACCTHD1.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetThdHigh(HI_U32 thd_high)
{
    U_VHDACCTHD1 VHDACCTHD1;

    VHDACCTHD1.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCTHD1.u32));
    VHDACCTHD1.bits.thd_high = thd_high;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCTHD1.u32),VHDACCTHD1.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetThdLow(HI_U32 thd_low)
{
    U_VHDACCTHD1 VHDACCTHD1;

    VHDACCTHD1.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCTHD1.u32));
    VHDACCTHD1.bits.thd_low = thd_low;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCTHD1.u32),VHDACCTHD1.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetCkGtEn(HI_U32 ck_gt_en)
{
    U_VHDACCTHD2 VHDACCTHD2;

    VHDACCTHD2.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCTHD2.u32));
    VHDACCTHD2.bits.ck_gt_en = ck_gt_en;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCTHD2.u32),VHDACCTHD2.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetAccRst(HI_U32 acc_rst)
{
    U_VHDACCTHD2 VHDACCTHD2;

    VHDACCTHD2.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCTHD2.u32));
    VHDACCTHD2.bits.acc_rst = acc_rst;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCTHD2.u32),VHDACCTHD2.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetThdMedHigh(HI_U32 thd_med_high)
{
    U_VHDACCTHD2 VHDACCTHD2;

    VHDACCTHD2.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCTHD2.u32));
    VHDACCTHD2.bits.thd_med_high = thd_med_high;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCTHD2.u32),VHDACCTHD2.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetDemoSplitPoint(HI_U32 demo_split_point)
{
    U_VHDACCDEMO VHDACCDEMO;

    VHDACCDEMO.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCDEMO.u32));
    VHDACCDEMO.bits.demo_split_point = demo_split_point;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCDEMO.u32),VHDACCDEMO.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetDemoMode(HI_U32 demo_mode)
{
    U_VHDACCDEMO VHDACCDEMO;

    VHDACCDEMO.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCDEMO.u32));
    VHDACCDEMO.bits.demo_mode = demo_mode;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCDEMO.u32),VHDACCDEMO.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetDemoEn(HI_U32 demo_en)
{
    U_VHDACCDEMO VHDACCDEMO;

    VHDACCDEMO.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCDEMO.u32));
    VHDACCDEMO.bits.demo_en = demo_en;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCDEMO.u32),VHDACCDEMO.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetLowTableData2(HI_U32 low_table_data2)
{
    U_VHDACCLOW1 VHDACCLOW1;

    VHDACCLOW1.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCLOW1.u32));
    VHDACCLOW1.bits.low_table_data2 = low_table_data2;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCLOW1.u32),VHDACCLOW1.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetLowTableData1(HI_U32 low_table_data1)
{
    U_VHDACCLOW1 VHDACCLOW1;

    VHDACCLOW1.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCLOW1.u32));
    VHDACCLOW1.bits.low_table_data1 = low_table_data1;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCLOW1.u32),VHDACCLOW1.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetLowTableData0(HI_U32 low_table_data0)
{
    U_VHDACCLOW1 VHDACCLOW1;

    VHDACCLOW1.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCLOW1.u32));
    VHDACCLOW1.bits.low_table_data0 = low_table_data0;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCLOW1.u32),VHDACCLOW1.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetLowTableData5(HI_U32 low_table_data5)
{
    U_VHDACCLOW2 VHDACCLOW2;

    VHDACCLOW2.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCLOW2.u32));
    VHDACCLOW2.bits.low_table_data5 = low_table_data5;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCLOW2.u32),VHDACCLOW2.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetLowTableData4(HI_U32 low_table_data4)
{
    U_VHDACCLOW2 VHDACCLOW2;

    VHDACCLOW2.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCLOW2.u32));
    VHDACCLOW2.bits.low_table_data4 = low_table_data4;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCLOW2.u32),VHDACCLOW2.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetLowTableData3(HI_U32 low_table_data3)
{
    U_VHDACCLOW2 VHDACCLOW2;

    VHDACCLOW2.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCLOW2.u32));
    VHDACCLOW2.bits.low_table_data3 = low_table_data3;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCLOW2.u32),VHDACCLOW2.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetLowTableData8(HI_U32 low_table_data8)
{
    U_VHDACCLOW3 VHDACCLOW3;

    VHDACCLOW3.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCLOW3.u32));
    VHDACCLOW3.bits.low_table_data8 = low_table_data8;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCLOW3.u32),VHDACCLOW3.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetLowTableData7(HI_U32 low_table_data7)
{
    U_VHDACCLOW3 VHDACCLOW3;

    VHDACCLOW3.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCLOW3.u32));
    VHDACCLOW3.bits.low_table_data7 = low_table_data7;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCLOW3.u32),VHDACCLOW3.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetLowTableData6(HI_U32 low_table_data6)
{
    U_VHDACCLOW3 VHDACCLOW3;

    VHDACCLOW3.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCLOW3.u32));
    VHDACCLOW3.bits.low_table_data6 = low_table_data6;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCLOW3.u32),VHDACCLOW3.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetMidTableData2(HI_U32 mid_table_data2)
{
    U_VHDACCMED1 VHDACCMED1;

    VHDACCMED1.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCMED1.u32));
    VHDACCMED1.bits.mid_table_data2 = mid_table_data2;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCMED1.u32),VHDACCMED1.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetMidTableData1(HI_U32 mid_table_data1)
{
    U_VHDACCMED1 VHDACCMED1;

    VHDACCMED1.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCMED1.u32));
    VHDACCMED1.bits.mid_table_data1 = mid_table_data1;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCMED1.u32),VHDACCMED1.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetMidTableData0(HI_U32 mid_table_data0)
{
    U_VHDACCMED1 VHDACCMED1;

    VHDACCMED1.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCMED1.u32));
    VHDACCMED1.bits.mid_table_data0 = mid_table_data0;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCMED1.u32),VHDACCMED1.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetMidTableData5(HI_U32 mid_table_data5)
{
    U_VHDACCMED2 VHDACCMED2;

    VHDACCMED2.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCMED2.u32));
    VHDACCMED2.bits.mid_table_data5 = mid_table_data5;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCMED2.u32),VHDACCMED2.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetMidTableData4(HI_U32 mid_table_data4)
{
    U_VHDACCMED2 VHDACCMED2;

    VHDACCMED2.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCMED2.u32));
    VHDACCMED2.bits.mid_table_data4 = mid_table_data4;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCMED2.u32),VHDACCMED2.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetMidTableData3(HI_U32 mid_table_data3)
{
    U_VHDACCMED2 VHDACCMED2;

    VHDACCMED2.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCMED2.u32));
    VHDACCMED2.bits.mid_table_data3 = mid_table_data3;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCMED2.u32),VHDACCMED2.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetMidTableData8(HI_U32 mid_table_data8)
{
    U_VHDACCMED3 VHDACCMED3;

    VHDACCMED3.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCMED3.u32));
    VHDACCMED3.bits.mid_table_data8 = mid_table_data8;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCMED3.u32),VHDACCMED3.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetMidTableData7(HI_U32 mid_table_data7)
{
    U_VHDACCMED3 VHDACCMED3;

    VHDACCMED3.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCMED3.u32));
    VHDACCMED3.bits.mid_table_data7 = mid_table_data7;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCMED3.u32),VHDACCMED3.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetMidTableData6(HI_U32 mid_table_data6)
{
    U_VHDACCMED3 VHDACCMED3;

    VHDACCMED3.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCMED3.u32));
    VHDACCMED3.bits.mid_table_data6 = mid_table_data6;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCMED3.u32),VHDACCMED3.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetHighTableData2(HI_U32 high_table_data2)
{
    U_VHDACCHIGH1 VHDACCHIGH1;

    VHDACCHIGH1.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCHIGH1.u32));
    VHDACCHIGH1.bits.high_table_data2 = high_table_data2;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCHIGH1.u32),VHDACCHIGH1.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetHighTableData1(HI_U32 high_table_data1)
{
    U_VHDACCHIGH1 VHDACCHIGH1;

    VHDACCHIGH1.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCHIGH1.u32));
    VHDACCHIGH1.bits.high_table_data1 = high_table_data1;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCHIGH1.u32),VHDACCHIGH1.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetHighTableData0(HI_U32 high_table_data0)
{
    U_VHDACCHIGH1 VHDACCHIGH1;

    VHDACCHIGH1.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCHIGH1.u32));
    VHDACCHIGH1.bits.high_table_data0 = high_table_data0;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCHIGH1.u32),VHDACCHIGH1.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetHighTableData5(HI_U32 high_table_data5)
{
    U_VHDACCHIGH2 VHDACCHIGH2;

    VHDACCHIGH2.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCHIGH2.u32));
    VHDACCHIGH2.bits.high_table_data5 = high_table_data5;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCHIGH2.u32),VHDACCHIGH2.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetHighTableData4(HI_U32 high_table_data4)
{
    U_VHDACCHIGH2 VHDACCHIGH2;

    VHDACCHIGH2.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCHIGH2.u32));
    VHDACCHIGH2.bits.high_table_data4 = high_table_data4;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCHIGH2.u32),VHDACCHIGH2.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetHighTableData3(HI_U32 high_table_data3)
{
    U_VHDACCHIGH2 VHDACCHIGH2;

    VHDACCHIGH2.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCHIGH2.u32));
    VHDACCHIGH2.bits.high_table_data3 = high_table_data3;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCHIGH2.u32),VHDACCHIGH2.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetHighTableData8(HI_U32 high_table_data8)
{
    U_VHDACCHIGH3 VHDACCHIGH3;

    VHDACCHIGH3.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCHIGH3.u32));
    VHDACCHIGH3.bits.high_table_data8 = high_table_data8;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCHIGH3.u32),VHDACCHIGH3.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetHighTableData7(HI_U32 high_table_data7)
{
    U_VHDACCHIGH3 VHDACCHIGH3;

    VHDACCHIGH3.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCHIGH3.u32));
    VHDACCHIGH3.bits.high_table_data7 = high_table_data7;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCHIGH3.u32),VHDACCHIGH3.u32);

    return ;
}


HI_VOID VDP_XDP_ACC_SetHighTableData6(HI_U32 high_table_data6)
{
    U_VHDACCHIGH3 VHDACCHIGH3;

    VHDACCHIGH3.u32 = VDP_RegRead((HI_ULONG)&(pVdpReg->VHDACCHIGH3.u32));
    VHDACCHIGH3.bits.high_table_data6 = high_table_data6;
    VDP_RegWrite((HI_ULONG)&(pVdpReg->VHDACCHIGH3.u32),VHDACCHIGH3.u32);

    return ;
}
