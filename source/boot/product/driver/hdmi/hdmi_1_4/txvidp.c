/***********************************************************************************/
/*  Copyright (c) 2002-2006, Silicon Image, Inc.  All rights reserved.             */
/*  No part of this work may be reproduced, modified, distributed, transmitted,    */
/*  transcribed, or translated into any language or computer format, in any form   */
/*  or by any means without written permission of: Silicon Image, Inc.,            */
/*  1060 East Arques Avenue, Sunnyvale, California 94085                           */
/***********************************************************************************/
#include "typedefs.h"
#include "txvptbl.h"
#include "defstx.h"
#include "hdmitx.h"
#include "txvidp.h"
#include "siitxapidefs.h"
//#include "vmode.h"
//#include "hdcp.h"
//#include "eedefs.h"
#include "hi_unf_hdmi.h"
#include "phy.h"

HI_U8 SiIVidPathInIndex;
HI_U8 SiIVidPathOutIndex;

extern ROM const char * const inMode[];
//extern ROM const VModeInfoType VModeTables[NMODES];
//extern void BlockWriteEEPROM(HI_U8, HI_U16, const HI_U8 *);

HI_U8 ConfigTXVideoMode(HI_U8 In, HI_U8 Out)
{

    HI_U8 TblVal, RegVal;
    
    TblVal = *((HI_U8*)(inMode[In] + Out));
    RegVal = ReadByteHDMITXP0(TX_VID_MODE_ADDR);
    if( TblVal & TX_DeMux)
        RegVal |=BIT_TX_DEMUX_YC;
    else
        RegVal &= (~BIT_TX_DEMUX_YC);
        
    if( TblVal & TX_SyncExtr)
        RegVal |=BIT_TX_SYNC_EXTR;
    else
        RegVal &= (~BIT_TX_SYNC_EXTR);
        
    if( TblVal & TX_YCbCrToRGB)
    {
        RegVal |= BIT_TX_CSC;
        RegVal |= BIT_TX_16_235_RANGE;  // expand range
    }
    else
    {
        RegVal &= (~BIT_TX_CSC);
        RegVal &= (~BIT_TX_16_235_RANGE);
    }
    
    if( TblVal & TX_Dither)
        RegVal |=BIT_TX_DITHER;
    else
        RegVal &= (~BIT_TX_DITHER);
        
    if( TblVal & TX_422to444)
        RegVal |= BIT_TX_422to444;
    else
        RegVal &= (~BIT_TX_422to444);

    WriteByteHDMITXP0(TX_VID_MODE_ADDR, RegVal);
    HDMIPrint("ConfigTXVideoMode in:0x%02x: out:0x%02x, RegVal:0x%02x\n", In, Out, RegVal);
    RegVal = ReadByteHDMITXP0(TX_SYS_CTRL1_ADDR);
    if( TblVal & TX_DVO)
        RegVal &= (~BIT_BSEL24BITS);
    else
        RegVal |= BIT_BSEL24BITS;
    WriteByteHDMITXP0(TX_SYS_CTRL1_ADDR, RegVal);

    /* TODO */
    /* Add code fo RBG to YCbCr Converter and Down Sampleing here */

    return TblVal;

}
//---------------------------------------------------------------------------
// Function Name: SetDeepColor
// Function Description:  This function sets Deep Color
//---------------------------------------------------------------------------
void SetDeepColor ( HI_U8 bDeepColor )
{
    HI_U8 bRegVal, bTmpDeepColor;
    HI_U8 bRegVal2;
    HI_U32 u32Value = 0;

    bTmpDeepColor = bDeepColor;
    if (bTmpDeepColor == SiI_DeepColor_Off)
    {
        bDeepColor = SiI_DeepColor_24bit;       // Setup everything as 24bpp but do not turn deep color on
    }

    // VID_ACEN_ADDR
    //  [7:6] - Wide Bus
    //          0b00 = 24 bits
    //          0b01 = 30 bits
    //          0b10 = 36 bits
    //bRegVal = (ReadByteHDMITXP0 ( VID_ACEN_ADDR ) & VID_ACEN_DEEP_COLOR_CLR);	
    bRegVal = (ReadByteHDMITXP0 ( VID_IN_MODE ) & VIN_MODE_CLR);	
    
    /* we give a fixed input bit widths value of 12bit for every channel*/
    bRegVal |= 0x06;

#ifndef _FPGA_FRED2_

    WriteByteHDMITXP0 (VID_IN_MODE,  bRegVal);
#else

    //lc change WriteByteHDMITXP0 (VID_ACEN_ADDR,  (bRegVal | 0x80));
    HDMIPrint("try to write VID_ACEN_ADDR:0x%02x, data:0x%02x\n", VID_IN_MODE, bRegVal);
    WriteByteHDMITXP0 (VID_IN_MODE,  bRegVal);
#endif

    HDMIPrint ("[TXVIDP.C](SI_SetDeepColor): Set Deep Color VID_ACEN_ADDR bDeepColor:%d\n", bDeepColor);

    // AUDP_TXCTRL_ADDR
    //  [5:3] PACKET_MODE
    //          0b100 = 24 bits
    //          0b101 = 30 bits
    //          0b110 = 36 bits
    // Set / Clear bit 5 separately below.
    bRegVal = (ReadByteHDMITXP1 ( AUDP_TXCTRL_ADDR ) & 0xE7);
    bRegVal |= (bDeepColor << 3);

    if ((bTmpDeepColor != SiI_DeepColor_Off) && (bTmpDeepColor != SiI_DeepColor_24bit))
    {
        bRegVal |= BIT_DEEPCOLOR_EN;
        bRegVal |= 0x20;

        // Enable dithering and set Dither Mode for Deep Color:
        bRegVal2 = (ReadByteHDMITXP0 ( TX_VID_MODE_ADDR ) & CLR_BITS_7_6_5);
        bRegVal2 |= (bDeepColor << 6);
        bRegVal2 |= BIT_DITHER_EN;
        u32Value = 0; //disable vid_dither 0x4F
    }
    else
    {
        bRegVal &= (~BIT_DEEPCOLOR_EN);
       // bRegVal &= (~0x20);
        bRegVal |= 0x20;
        bRegVal2 = (ReadByteHDMITXP0 ( TX_VID_MODE_ADDR ) & CLR_BITS_7_6_5);    // Disable dithering if not DC
        bRegVal2 |= BIT_DITHER_EN;
        u32Value = 0xe; //Enable D_RC_EN, D_GC_EN, D_BC_EN
    }
    /*set deep color */
    WriteByteHDMITXP0 (  TX_VID_DITHER, u32Value );
    WriteByteHDMITXP1 (  AUDP_TXCTRL_ADDR, bRegVal );
    HDMIPrint ("[TXVIDP.C](SI_SetDeepColor): Set Deep Color AUDP_TXCTRL_ADDR:0x%02x, data:0x%02x\n", AUDP_TXCTRL_ADDR, bRegVal);
    WriteByteHDMITXP0 (  TX_VID_MODE_ADDR, bRegVal2 );
    HDMIPrint ("[TXVIDP.C](SI_SetDeepColor): Set Deep Color AUDP_TXCTRL_ADDR:0x%02x, data:0x%02x\n", TX_VID_MODE_ADDR, bRegVal2);

    TX_PHY_SetDeepColor(bDeepColor);

    return;  
}
//---------------------------------------------------------------------------
// Function Name: SetInputClockEdge
// Function Description:  This function sets Input Clock Edge
//---------------------------------------------------------------------------

static void SetInputClockEdge( HI_U8 bOn )
{
    HI_U8 bRegVal;

    bRegVal = ReadByteHDMITXP0(TX_SYS_CTRL1_ADDR);
    if( bOn )
        bRegVal |= BIT_TX_CLOCK_RISING_EDGE;
    else
        bRegVal &= (~BIT_TX_CLOCK_RISING_EDGE);
    WriteByteHDMITXP0(TX_SYS_CTRL1_ADDR, bRegVal);

}
//------------------------------------------------------------------------------
// Function Name: siiSetVideoPath
// Function Description: This functiom sets video path, for for different Input/Output
//                       Video formats, it doesn't include setting Resolution dependent parameters
// Accepts: poinetr on Video path parameters
// Returns: none
// Globals: none
//------------------------------------------------------------------------------

////////////////////////////////////////////////////////////////////////////////////////////
// abVideoPath[0] = Input Source : 0 - RGB24; 1 - RGB DVO 12; 2 - YCbCr24; 3 - YC24; 4 - YCbCr4:2:2
// abVideoPath[1] = Color Space Conversion : 0 - RGB out; 1 - YCbr (4:4:4) out
// abVideoPath[2] = Clock Edge : 0 - Falling edge; 1 - Rising Edge
// abVideoPath[3] = Deep Color Mode : 0 - 24 bit; 1 - 30 bits; 2 - 36 bits
////////////////////////////////////////////////////////////////////////////////////////////


void SI_SetAudioPath ( HI_U8 * abAudioPath )
{
    HI_U8 bRegVal1, bRegVal2, bRegVal3;//u8Value;
    HI_U8 bAudioModes;
    HDMIPrint("abAudioPath setting auido path:0x%02x,0x%02x,0x%02x,0x%02x\n", abAudioPath[0], abAudioPath[1], abAudioPath[2], abAudioPath[3]);

    bRegVal1 = ReadByteHDMITXP1 (AUD_MODE_ADDR);          // 0x7A:0x14
    bRegVal1 &= ~BIT_EN_AUDIO; 							  // disable audio input stream
    WriteByteHDMITXP1(AUD_MODE_ADDR, bRegVal1);
    WriteWordHDMITXP1( N_SVAL_ADDR, (HI_U16) 6144 & 0xFFFF);
    WriteByteHDMITXP1( N_SVAL_ADDR+2, (HI_U16)(6144 >> 16));
    WriteByteHDMITXP1( I2S_CHST4_ADDR, 2);
    WriteByteHDMITXP1(0x08,((148500>>16)&0xff));  // 0x7A:0x0b
    WriteByteHDMITXP1(0x07,((148500>>8)&0xff));  // 0x7A:0x0a
    WriteByteHDMITXP1(0x06,(148500&0xff));  // 0x7A:0x09
    bAudioModes = abAudioPath[0] & SiI_AudioModesSelect;   // Input audio format
    bRegVal1 = ReadByteHDMITXP1 ( AUD_MODE_ADDR );          // 0x7A:0x14
    bRegVal2 = ReadByteHDMITXP1 ( AUDP_TXCTRL_ADDR );       // 0x7A:0x2F
    if (bAudioModes == SiI_SPDIF)
    {
        bRegVal2 &= (~BIT_LAYOUT1);
        bRegVal1 &= (~SD_0_3_EN);

        bRegVal1 |= BIT_SPDIF_SELECT;
        bRegVal3 = ( SCK_RISING |  BIT_COMPRESSED);
        WriteByteHDMITXP1( I2S_IN_CTRL_ADDR, bRegVal3);
        WriteByteHDMITXP1( I2S_IN_LEN, HBRA_IN_CTRL_VAL);
        bRegVal2 |= HBRA_ZERO_PLUS;
        WriteByteHDMITXP1(I2S_CHST0_ADDR, NON_PCM_TYPE);
        WriteByteHDMITXP1(I2S_CHST4_ADDR, HBRA_FOR_CHST4);
        WriteByteHDMITXP1(I2S_CHST5_ADDR, HBRA_FOR_CHST5);
        WriteByteHDMITXP1(SAMPLE_RATE_CONVERSION, HBR_SPR_MASK);

        HDMIPrint("use SPDIF\n");
    }
    else                                // not SPDIF
    {
        bRegVal3 = abAudioPath[2];             // Input I2S sample length
        WriteByteHDMITXP1(I2S_IN_LEN, bRegVal3);
        bRegVal1 &= (~BIT_SPDIF_SELECT);
        bRegVal1 &= (~SD_0_3_EN);       // Clear bits 7:4
        if (abAudioPath[0] & SiI_MultyChannel)
        {
            bRegVal1 |= SD_0_3_EN;          // All other modes need to enable I2S channel inputs
            bRegVal2 |= BIT_LAYOUT1;
        }
        else
        {
            bRegVal1 |= SD_0;          // All other modes need to enable I2S channel inputs
            bRegVal2 &= (~BIT_LAYOUT1);
        }
        if (bAudioModes == SiI_DSD)   // DSD Audio
        {
            bRegVal1 |= BIT_DSD_SELECT;
        }
        else                            // Not DSD Audio. Could be I2S or HBR
        {
            bRegVal1 &= (~BIT_DSD_SELECT);
            if (bAudioModes == SiI_I2S)
            {
                WriteByteHDMITXP1( I2S_CHST4_ADDR, abAudioPath[1]);   // Fs
                WriteByteHDMITXP1( I2S_CHST5_ADDR, (abAudioPath[2] | ((abAudioPath[1] << 4) & 0xF0)));   // "Original Fs" and Length
                WriteByteHDMITXP1( I2S_IN_CTRL_ADDR, abAudioPath[3]);
            }
            else                        // HBRA
            {
                HDMIPrint("set HBRA in Audio Path\n");
                bRegVal3 = (BIT_HBR_ON | SCK_RISING | BIT_CBIT_ORDER | BIT_COMPRESSED);
                WriteByteHDMITXP1( I2S_IN_CTRL_ADDR, bRegVal3);		     	// Write 0xF0 to 0x7A:0x1D
                bRegVal1 |= SETUP_ENABLE_HBRA;                       		// Write 0xF1 to 0x7A:0x14
                WriteByteHDMITXP1( I2S_IN_LEN, HBRA_IN_CTRL_VAL);   		// Write 0x92 to 0x7A:0x24
                bRegVal2 &= (~BIT_LAYOUT1);
                WriteByteHDMITXP1(I2S_CHST0_ADDR, NON_PCM_TYPE); 			// Write 0x04 to0x7A:0x1E to set 0x1E[1] (workaround)
                WriteByteHDMITXP1(I2S_CHST4_ADDR, HBRA_FOR_CHST4); 			// Write 0x09 to0x7A:0x21
                WriteByteHDMITXP1(I2S_CHST5_ADDR, HBRA_FOR_CHST5); 			// Write 0xE2 to0x7A:0x22
                WriteByteHDMITXP1(SAMPLE_RATE_CONVERSION, HBR_SPR_MASK);	// Write 0x0 to 0x7A:0x23
            }
        }
        HDMIPrint("use I2S\n");
    }
    DelayMS(1); 											// allow FIFO to flush
    bRegVal1 |= BIT_EN_AUDIO; 								// Enable audio
    WriteByteHDMITXP1( AUD_MODE_ADDR, bRegVal1);
    HDMIPrint("Set AUDP_TXCTRL_ADDR to AUD_MODE_ADDR:0x%x AUDP_TXCTRL_ADDR:0x%x\n", bRegVal1, bRegVal2);
    WriteByteHDMITXP1 ( AUDP_TXCTRL_ADDR , bRegVal2 );
    return;
}

void siiSetVideoPath ( HI_U8 bVMode, HI_U8 * abVideoPath )
{
//  HI_U8 bError;
    static HI_U8 InfCtrl1, InfCtrl2;

    if (HI_NULL == abVideoPath)
    {
        return;
    }
    HDMIPrint("siiSetVideoPath bVMode:0x%02x\n", bVMode);
    //BlockWriteEEPROM( 4, EE_TX_VIDEOPATH_ADDR , abVideoPath);

    SiIVidPathInIndex = abVideoPath[0];
    SiIVidPathOutIndex = abVideoPath[1];
    HDMIPrint("siiSetVideoPath setting video path abVideoPath:0x%02x,0x%02x,0x%02x,0x%02x\n", abVideoPath[0], abVideoPath[1], abVideoPath[2], abVideoPath[3]);
    ConfigTXVideoMode( abVideoPath[0], abVideoPath[1]);
    SetInputClockEdge( abVideoPath[2] );
    SetDeepColor ( abVideoPath[3] );

#if 0 /*--TMDS has been del in 1.4 ctrller--*/
    bError = SI_TMDS_setup(bVMode);

    if (bError == TMDS_SETUP_FAILED)
    {
        HI_INFO_HDMI ("[TXVIDP.C](SI_SetVideoPath): TMDS_SETUP_FAILED\n");
    }
#endif /*--NO MODIFY : COMMENT BY CODINGPARTNER--*/

    InfCtrl1 = ReadByteHDMITXP1(INF_CTRL1);    // save packet buffer control regs
    InfCtrl2 = ReadByteHDMITXP1(INF_CTRL2);

    // Reset internal state machines and allow TCLK to Rx to stabilize
    HDMIPrint("siiSetVideoPath to do SW_ResetHDMITX\n");
    SW_ResetHDMITX();

    WriteByteHDMITXP1(INF_CTRL1, InfCtrl1);        // Retrieve packet buffer control regs
    WriteByteHDMITXP1(INF_CTRL2, InfCtrl2);
    HDMIPrint("siiSetVideoPath end\n");
}
//------------------------------------------------------------------------------
// Function Name: siiGetVideoPath
// Function Description: This functiom gets video path, for for different Input/Output
//                       Video formats, it doesn't include setting Resolution dependent parameters
// Accepts: none
// Returns: poinetr on Video path parameters
// Globals: none
//------------------------------------------------------------------------------
void siiGetVideoPath ( HI_U8 * abVideoPath )
{
    HI_U8 bRegVal;
    HDMIPrint("siiGetVideoPath\n");
    
    if (HI_NULL == abVideoPath)
    {
        return;
    }
    abVideoPath[0] = SiIVidPathInIndex;
    abVideoPath[1] = SiIVidPathOutIndex;

    bRegVal = ReadByteHDMITXP0(TX_SYS_CTRL1_ADDR);
    abVideoPath[2] = 0;
    if( bRegVal & BIT_TX_CLOCK_RISING_EDGE )
        abVideoPath[2]|= SiI_RisingVideoClockEdge;

    bRegVal = ReadByteHDMITXP1 (  AUDP_TXCTRL_ADDR );
    if (!(bRegVal & BIT_DEEPCOLOR_EN))
    {
        abVideoPath[3] = 0xFF;
    }
    else
    {
        abVideoPath[3] = bRegVal >> 3;
        abVideoPath[3] &= 0x03;         // extract Deep Color  bits
    }
}

