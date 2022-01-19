//****************************************************************************** 
// Copyright     :  Copyright (C) 2015, Hisilicon Technologies Co., Ltd.
// File name     :  hi_reg_io.h
// Author        :   
// Version       :  1.0 
// Date          :  2015-03-02
// Description   :  Define all registers/tables for SYS_CTRL
// Others        :  Generated automatically by nManager V4.0 
// History       :    2015-03-02 Create file
//******************************************************************************

#ifndef __HI_REG_IO_H__
#define __HI_REG_IO_H__

/* Define the union U_ioshare_0 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_0             : 2   ; /* [1..0]  */
        unsigned int    reserved_0            : 2   ; /* [3..2]  */
        unsigned int    ioctrl_0_DS           : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_0_SR           : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_0_PD           : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_0;

/* Define the union U_ioshare_1 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_1             : 2   ; /* [1..0]  */
        unsigned int    reserved_0            : 2   ; /* [3..2]  */
        unsigned int    ioctrl_1_DS           : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_1_SR           : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_1_PD           : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_1;

/* Define the union U_ioshare_2 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_2             : 2   ; /* [1..0]  */
        unsigned int    reserved_0            : 2   ; /* [3..2]  */
        unsigned int    ioctrl_2_DS           : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    ioctrl_2_SR           : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_2_OPU          : 1   ; /* [12]  */
        unsigned int    ioctrl_2_PD           : 1   ; /* [13]  */
        unsigned int    reserved_3            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_2;

/* Define the union U_ioshare_3 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_3             : 2   ; /* [1..0]  */
        unsigned int    reserved_0            : 2   ; /* [3..2]  */
        unsigned int    ioctrl_3_DS           : 4   ; /* [7..4]  */
        unsigned int    ioctrl_3_SR           : 1   ; /* [8]  */
        unsigned int    reserved_1            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_3_PU           : 1   ; /* [12]  */
        unsigned int    ioctrl_3_PD           : 1   ; /* [13]  */
        unsigned int    reserved_2            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_3;

/* Define the union U_ioshare_4 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_4             : 2   ; /* [1..0]  */
        unsigned int    reserved_0            : 2   ; /* [3..2]  */
        unsigned int    ioctrl_4_DS           : 4   ; /* [7..4]  */
        unsigned int    ioctrl_4_SR           : 1   ; /* [8]  */
        unsigned int    reserved_1            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_4_PU           : 1   ; /* [12]  */
        unsigned int    ioctrl_4_PD           : 1   ; /* [13]  */
        unsigned int    reserved_2            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_4;

/* Define the union U_ioshare_5 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_5             : 2   ; /* [1..0]  */
        unsigned int    reserved_0            : 2   ; /* [3..2]  */
        unsigned int    ioctrl_5_DS           : 4   ; /* [7..4]  */
        unsigned int    ioctrl_5_SR           : 1   ; /* [8]  */
        unsigned int    reserved_1            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_5_PU           : 1   ; /* [12]  */
        unsigned int    ioctrl_5_PD           : 1   ; /* [13]  */
        unsigned int    reserved_2            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_5;

/* Define the union U_ioshare_6 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_6             : 2   ; /* [1..0]  */
        unsigned int    reserved_0            : 2   ; /* [3..2]  */
        unsigned int    ioctrl_6_DS           : 4   ; /* [7..4]  */
        unsigned int    ioctrl_6_SR           : 1   ; /* [8]  */
        unsigned int    reserved_1            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_6_PU           : 1   ; /* [12]  */
        unsigned int    ioctrl_6_PD           : 1   ; /* [13]  */
        unsigned int    reserved_2            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_6;

/* Define the union U_ioshare_7 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_7             : 2   ; /* [1..0]  */
        unsigned int    reserved_0            : 2   ; /* [3..2]  */
        unsigned int    ioctrl_7_DS           : 4   ; /* [7..4]  */
        unsigned int    ioctrl_7_SR           : 1   ; /* [8]  */
        unsigned int    reserved_1            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_7_PU           : 1   ; /* [12]  */
        unsigned int    ioctrl_7_PD           : 1   ; /* [13]  */
        unsigned int    reserved_2            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_7;

/* Define the union U_ioshare_8 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_8             : 2   ; /* [1..0]  */
        unsigned int    reserved_0            : 2   ; /* [3..2]  */
        unsigned int    ioctrl_8_DS           : 4   ; /* [7..4]  */
        unsigned int    ioctrl_8_SR           : 1   ; /* [8]  */
        unsigned int    reserved_1            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_8_PU           : 1   ; /* [12]  */
        unsigned int    ioctrl_8_PD           : 1   ; /* [13]  */
        unsigned int    reserved_2            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_8;

/* Define the union U_ioshare_9 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_9             : 2   ; /* [1..0]  */
        unsigned int    reserved_0            : 2   ; /* [3..2]  */
        unsigned int    ioctrl_9_DS           : 4   ; /* [7..4]  */
        unsigned int    ioctrl_9_SR           : 1   ; /* [8]  */
        unsigned int    reserved_1            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_9_PU           : 1   ; /* [12]  */
        unsigned int    ioctrl_9_PD           : 1   ; /* [13]  */
        unsigned int    reserved_2            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_9;

/* Define the union U_ioshare_10 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_10            : 2   ; /* [1..0]  */
        unsigned int    reserved_0            : 2   ; /* [3..2]  */
        unsigned int    ioctrl_9_DS           : 4   ; /* [7..4]  */
        unsigned int    ioctrl_9_SR           : 1   ; /* [8]  */
        unsigned int    reserved_1            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_9_PU           : 1   ; /* [12]  */
        unsigned int    ioctrl_9_PD           : 1   ; /* [13]  */
        unsigned int    reserved_2            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_10;

/* Define the union U_ioshare_11 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_11            : 2   ; /* [1..0]  */
        unsigned int    reserved_0            : 2   ; /* [3..2]  */
        unsigned int    ioctrl_11_DS          : 4   ; /* [7..4]  */
        unsigned int    ioctrl_11_SR          : 1   ; /* [8]  */
        unsigned int    reserved_1            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_11_PU          : 1   ; /* [12]  */
        unsigned int    ioctrl_11_PD          : 1   ; /* [13]  */
        unsigned int    reserved_2            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_11;

/* Define the union U_ioshare_12 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_12            : 2   ; /* [1..0]  */
        unsigned int    reserved_0            : 2   ; /* [3..2]  */
        unsigned int    ioctrl_12_DS          : 4   ; /* [7..4]  */
        unsigned int    ioctrl_12_SR          : 1   ; /* [8]  */
        unsigned int    reserved_1            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_12_PU          : 1   ; /* [12]  */
        unsigned int    ioctrl_12_PD          : 1   ; /* [13]  */
        unsigned int    reserved_2            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_12;

/* Define the union U_ioshare_13 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_13            : 2   ; /* [1..0]  */
        unsigned int    reserved_0            : 2   ; /* [3..2]  */
        unsigned int    ioctrl_13_DS          : 4   ; /* [7..4]  */
        unsigned int    ioctrl_13_SR          : 1   ; /* [8]  */
        unsigned int    reserved_1            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_13_PU          : 1   ; /* [12]  */
        unsigned int    ioctrl_13_PD          : 1   ; /* [13]  */
        unsigned int    reserved_2            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_13;

/* Define the union U_ioshare_14 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_14            : 2   ; /* [1..0]  */
        unsigned int    reserved_0            : 2   ; /* [3..2]  */
        unsigned int    ioctrl_14_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_14_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_14_OPU         : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_14;

/* Define the union U_ioshare_15 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_15            : 2   ; /* [1..0]  */
        unsigned int    reserved_0            : 2   ; /* [3..2]  */
        unsigned int    ioctrl_15_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_15_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_15_OPU         : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_15;

/* Define the union U_ioshare_16 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_16            : 2   ; /* [1..0]  */
        unsigned int    reserved_0            : 2   ; /* [3..2]  */
        unsigned int    ioctrl_16_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_16_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_16_OPU         : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_16;

/* Define the union U_ioshare_17 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_17            : 2   ; /* [1..0]  */
        unsigned int    reserved_0            : 2   ; /* [3..2]  */
        unsigned int    ioctrl_17_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_17_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_17_OPU         : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_17;

/* Define the union U_ioshare_18 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_18            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_18_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_18_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_18_PD          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_18;

/* Define the union U_ioshare_19 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_19            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_19_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_19_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_19_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_19;

/* Define the union U_ioshare_20 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_20            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_20_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_20_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_20_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_20;

/* Define the union U_ioshare_21 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_21            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_21_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_21_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_21_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_21;

/* Define the union U_ioshare_22 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_22            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_22_DS          : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    ioctrl_22_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_22_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_22;

/* Define the union U_ioshare_23 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_23            : 1   ; /* [0]  */
        unsigned int    reserved_0            : 3   ; /* [3..1]  */
        unsigned int    ioctrl_23_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_23_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_23_PD          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_23;

/* Define the union U_ioshare_24 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_24            : 1   ; /* [0]  */
        unsigned int    reserved_0            : 3   ; /* [3..1]  */
        unsigned int    ioctrl_24_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_24_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_24_PD          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_24;

/* Define the union U_ioshare_25 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_25            : 1   ; /* [0]  */
        unsigned int    reserved_0            : 3   ; /* [3..1]  */
        unsigned int    ioctrl_25_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_25_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_25_PD          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_25;

/* Define the union U_ioshare_26 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_26            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_26_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_26_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_26_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_26;

/* Define the union U_ioshare_27 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_27            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_27_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_27_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_27_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_27;

/* Define the union U_ioshare_28 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_28            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_28_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_28_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_28_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_28;

/* Define the union U_ioshare_29 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_29            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_29_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_29_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_29_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_29;

/* Define the union U_ioshare_30 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_30            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_30_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_30_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_30_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_30;

/* Define the union U_ioshare_31 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_31            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_31_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_31_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_31_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_31;

/* Define the union U_ioshare_32 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_32            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_32_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_32_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_32_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_32;

/* Define the union U_ioshare_33 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_33            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_33_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_33_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_33_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_33;

/* Define the union U_ioshare_34 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_34            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_34_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_34_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_34_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_34;

/* Define the union U_ioshare_35 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_35            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_35_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_35_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_35_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_35;

/* Define the union U_ioshare_36 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_36            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_36_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_36_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_36_PD          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_36;

/* Define the union U_ioshare_37 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_37            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_37_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_37_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_37_PD          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_37;

/* Define the union U_ioshare_38 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_38            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_38_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_38_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_38_PD          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_38;

/* Define the union U_ioshare_39 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_39            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_39_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_39_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_39_PD          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_39;

/* Define the union U_ioshare_40 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_40            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_40_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_40_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_40_PD          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_40;

/* Define the union U_ioshare_41 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_41            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_41_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_41_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_41_PD          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_41;

/* Define the union U_ioshare_42 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_42            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_42_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_42_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_42_PD          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_42;

/* Define the union U_ioshare_43 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_43            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_43_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_43_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_43_PD          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_43;

/* Define the union U_ioshare_44 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_44            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_44_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_44_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_44_PD          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_44;

/* Define the union U_ioshare_45 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_45            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_45_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_45_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_45_PD          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_45;

/* Define the union U_ioshare_46 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_46            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_46_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_46_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_46_PD          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_46;

/* Define the union U_ioshare_47 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_47            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_47_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_47_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_47_PD          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_47;

/* Define the union U_ioshare_48 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_48            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_48_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_48_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_48_PD          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_48;

/* Define the union U_ioshare_49 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_49            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_49_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_49_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_49_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_49;

/* Define the union U_ioshare_50 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_50            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_50_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_50_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_50_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_50;

/* Define the union U_ioshare_51 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_51            : 1   ; /* [0]  */
        unsigned int    reserved_0            : 3   ; /* [3..1]  */
        unsigned int    ioctrl_51_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_51_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_51_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_51;

/* Define the union U_ioshare_53 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_53            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_53_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_53_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_53_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_53;

/* Define the union U_ioshare_54 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_54            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_54_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_54_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_54_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_54;

/* Define the union U_ioshare_55 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_55            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_55_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_55_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_55_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_55;

/* Define the union U_ioshare_56 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_56            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_56_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_56_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_56_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_56;

/* Define the union U_ioshare_57 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_57            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_57_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_57_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_57_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_57;

/* Define the union U_ioshare_58 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_58            : 2   ; /* [1..0]  */
        unsigned int    reserved_0            : 2   ; /* [3..2]  */
        unsigned int    ioctrl_58_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_58_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_58_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_58;

/* Define the union U_ioshare_59 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_59            : 1   ; /* [0]  */
        unsigned int    reserved_0            : 3   ; /* [3..1]  */
        unsigned int    ioctrl_59_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_59_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_59_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_59;

/* Define the union U_ioshare_69 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_69            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_69_DS          : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    ioctrl_69_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_69_PU          : 1   ; /* [12]  */
        unsigned int    ioctrl_69_PD          : 1   ; /* [13]  */
        unsigned int    reserved_3            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_69;

/* Define the union U_ioshare_61 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_61            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_61_DS          : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    ioctrl_61_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_61_PU          : 1   ; /* [12]  */
        unsigned int    ioctrl_61_PD          : 1   ; /* [13]  */
        unsigned int    reserved_3            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_61;

/* Define the union U_ioshare_62 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_62            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_62_DS          : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    ioctrl_62_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_62_PU          : 1   ; /* [12]  */
        unsigned int    ioctrl_62_PD          : 1   ; /* [13]  */
        unsigned int    reserved_3            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_62;

/* Define the union U_ioshare_63 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_63            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_63_DS          : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    ioctrl_63_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_63_PU          : 1   ; /* [12]  */
        unsigned int    ioctrl_63_PD          : 1   ; /* [13]  */
        unsigned int    reserved_3            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_63;

/* Define the union U_ioshare_64 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_64            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_64_DS          : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    ioctrl_64_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_64_PU          : 1   ; /* [12]  */
        unsigned int    ioctrl_64_PD          : 1   ; /* [13]  */
        unsigned int    reserved_3            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_64;

/* Define the union U_ioshare_65 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_65            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_65_DS          : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    ioctrl_65_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_65_PU          : 1   ; /* [12]  */
        unsigned int    ioctrl_65_PD          : 1   ; /* [13]  */
        unsigned int    reserved_3            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_65;

/* Define the union U_ioshare_66 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_66            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_66_DS          : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    ioctrl_66_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_66_PU          : 1   ; /* [12]  */
        unsigned int    ioctrl_66_PD          : 1   ; /* [13]  */
        unsigned int    reserved_3            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_66;

/* Define the union U_ioshare_67 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_67            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_67_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_67_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_67_PD          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_67;

/* Define the union U_ioshare_68 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_68            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_68_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_68_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_68_PD          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_68;

/* Define the union U_ioshare_60 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_60            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_60_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_60_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_60_PD          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_60;

/* Define the union U_ioshare_70 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_70            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_70_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_70_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_70_PD          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_70;

/* Define the union U_ioshare_71 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_71            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_71_DS          : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    ioctrl_71_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_71_PU          : 1   ; /* [12]  */
        unsigned int    ioctrl_71_PD          : 1   ; /* [13]  */
        unsigned int    reserved_3            : 18  ; /* [31..14]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_71;

/* Define the union U_ioshare_72 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_72            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_72_DS          : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    ioctrl_72_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_72_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_72;

/* Define the union U_ioshare_73 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_73            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_73_DS          : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    ioctrl_73_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_73_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_73;

/* Define the union U_ioshare_74 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_74            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_74_DS          : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    ioctrl_74_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_74_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_74;

/* Define the union U_ioshare_75 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_75            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_75_DS          : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    ioctrl_75_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_75_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_75;

/* Define the union U_ioshare_76 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_76            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_76_DS          : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    ioctrl_76_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_76_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_76;

/* Define the union U_ioshare_77 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_77            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    ioctrl_77_DS          : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    ioctrl_77_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_77_PU          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_77;

/* Define the union U_ioshare_78 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_78            : 1   ; /* [0]  */
        unsigned int    reserved_0            : 3   ; /* [3..1]  */
        unsigned int    ioctrl_78_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_78_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_78_PD          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_78;

/* Define the union U_ioshare_79 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ioshare_79            : 1   ; /* [0]  */
        unsigned int    reserved_0            : 3   ; /* [3..1]  */
        unsigned int    ioctrl_79_DS          : 2   ; /* [5..4]  */
        unsigned int    reserved_1            : 2   ; /* [7..6]  */
        unsigned int    ioctrl_79_SR          : 1   ; /* [8]  */
        unsigned int    reserved_2            : 3   ; /* [11..9]  */
        unsigned int    ioctrl_79_PD          : 1   ; /* [12]  */
        unsigned int    reserved_3            : 19  ; /* [31..13]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_ioshare_79;

//==============================================================================
/* Define the global struct */
typedef struct
{
    volatile U_ioshare_0            ioshare_0                ; /* 0x0 */
    volatile U_ioshare_1            ioshare_1                ; /* 0x4 */
    volatile U_ioshare_2            ioshare_2                ; /* 0x8 */
    volatile U_ioshare_3            ioshare_3                ; /* 0xc */
    volatile U_ioshare_4            ioshare_4                ; /* 0x10 */
    volatile U_ioshare_5            ioshare_5                ; /* 0x14 */
    volatile U_ioshare_6            ioshare_6                ; /* 0x18 */
    volatile U_ioshare_7            ioshare_7                ; /* 0x1c */
    volatile U_ioshare_8            ioshare_8                ; /* 0x20 */
    volatile U_ioshare_9            ioshare_9                ; /* 0x24 */
    volatile U_ioshare_10           ioshare_10               ; /* 0x28 */
    volatile U_ioshare_11           ioshare_11               ; /* 0x2c */
    volatile U_ioshare_12           ioshare_12               ; /* 0x30 */
    volatile U_ioshare_13           ioshare_13               ; /* 0x34 */
    volatile U_ioshare_14           ioshare_14               ; /* 0x38 */
    volatile U_ioshare_15           ioshare_15               ; /* 0x3c */
    volatile U_ioshare_16           ioshare_16               ; /* 0x40 */
    volatile U_ioshare_17           ioshare_17               ; /* 0x44 */
    volatile U_ioshare_18           ioshare_18               ; /* 0x48 */
    volatile U_ioshare_19           ioshare_19               ; /* 0x4c */
    volatile U_ioshare_20           ioshare_20               ; /* 0x50 */
    volatile U_ioshare_21           ioshare_21               ; /* 0x54 */
    volatile U_ioshare_22           ioshare_22               ; /* 0x58 */
    volatile U_ioshare_23           ioshare_23               ; /* 0x5c */
    volatile U_ioshare_24           ioshare_24               ; /* 0x60 */
    volatile U_ioshare_25           ioshare_25               ; /* 0x64 */
    volatile U_ioshare_26           ioshare_26               ; /* 0x68 */
    volatile U_ioshare_27           ioshare_27               ; /* 0x6c */
    volatile U_ioshare_28           ioshare_28               ; /* 0x70 */
    volatile U_ioshare_29           ioshare_29               ; /* 0x74 */
    volatile U_ioshare_30           ioshare_30               ; /* 0x78 */
    volatile U_ioshare_31           ioshare_31               ; /* 0x7c */
    volatile U_ioshare_32           ioshare_32               ; /* 0x80 */
    volatile U_ioshare_33           ioshare_33               ; /* 0x84 */
    volatile U_ioshare_34           ioshare_34               ; /* 0x88 */
    volatile U_ioshare_35           ioshare_35               ; /* 0x8c */
    volatile U_ioshare_36           ioshare_36               ; /* 0x90 */
    volatile U_ioshare_37           ioshare_37               ; /* 0x94 */
    volatile U_ioshare_38           ioshare_38               ; /* 0x98 */
    volatile U_ioshare_39           ioshare_39               ; /* 0x9c */
    volatile U_ioshare_40           ioshare_40               ; /* 0xa0 */
    volatile U_ioshare_41           ioshare_41               ; /* 0xa4 */
    volatile U_ioshare_42           ioshare_42               ; /* 0xa8 */
    volatile U_ioshare_43           ioshare_43               ; /* 0xac */
    volatile U_ioshare_44           ioshare_44               ; /* 0xb0 */
    volatile U_ioshare_45           ioshare_45               ; /* 0xb4 */
    volatile U_ioshare_46           ioshare_46               ; /* 0xb8 */
    volatile U_ioshare_47           ioshare_47               ; /* 0xbc */
    volatile U_ioshare_48           ioshare_48               ; /* 0xc0 */
    volatile U_ioshare_49           ioshare_49               ; /* 0xc4 */
    volatile U_ioshare_50           ioshare_50               ; /* 0xc8 */
    volatile U_ioshare_51           ioshare_51               ; /* 0xcc */
    volatile unsigned int           reserved_0                     ; /* 0xd0 */
    volatile U_ioshare_53           ioshare_53               ; /* 0xd4 */
    volatile U_ioshare_54           ioshare_54               ; /* 0xd8 */
    volatile U_ioshare_55           ioshare_55               ; /* 0xdc */
    volatile U_ioshare_56           ioshare_56               ; /* 0xe0 */
    volatile U_ioshare_57           ioshare_57               ; /* 0xe4 */
    volatile U_ioshare_58           ioshare_58               ; /* 0xe8 */
    volatile U_ioshare_59           ioshare_59               ; /* 0xec */
    volatile unsigned int           reserved_1[9]                     ; /* 0xf0~0x110 */
    volatile U_ioshare_69           ioshare_69               ; /* 0x114 */
    volatile U_ioshare_61           ioshare_61               ; /* 0xf4 */
    volatile U_ioshare_62           ioshare_62               ; /* 0xf8 */
    volatile U_ioshare_63           ioshare_63               ; /* 0xfc */
    volatile U_ioshare_64           ioshare_64               ; /* 0x100 */
    volatile U_ioshare_65           ioshare_65               ; /* 0x104 */
    volatile U_ioshare_66           ioshare_66               ; /* 0x108 */
    volatile U_ioshare_67           ioshare_67               ; /* 0x10c */
    volatile U_ioshare_68           ioshare_68               ; /* 0x110 */
    volatile U_ioshare_60           ioshare_60               ; /* 0xf0 */
    volatile unsigned int           reserved_2[9]                     ; /* 0xf4~0x114 */
    volatile U_ioshare_70           ioshare_70               ; /* 0x118 */
    volatile U_ioshare_71           ioshare_71               ; /* 0x11c */
    volatile U_ioshare_72           ioshare_72               ; /* 0x120 */
    volatile U_ioshare_73           ioshare_73               ; /* 0x124 */
    volatile U_ioshare_74           ioshare_74               ; /* 0x128 */
    volatile U_ioshare_75           ioshare_75               ; /* 0x12c */
    volatile U_ioshare_76           ioshare_76               ; /* 0x130 */
    volatile U_ioshare_77           ioshare_77               ; /* 0x134 */
    volatile U_ioshare_78           ioshare_78               ; /* 0x138 */
    volatile U_ioshare_79           ioshare_79               ; /* 0x13c */

} S_IO_REGS_TYPE;


#endif /* __HI_REG_IO_H__ */
