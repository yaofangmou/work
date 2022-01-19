#ifndef __HI_REG_VPSS_WBC_H__
#define __HI_REG_VPSS_WBC_H__

/* Define the union U_DB_HY_COUNTER */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int db_hy_counter          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_DB_HY_COUNTER;
/* Define the union U_DB_BORDER */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int db_border              : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_DB_BORDER;
/* Define the union U_DB_HY_SIZE */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hy_size               : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hy_counter            : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HY_SIZE;

/* Define the union U_DB_HC_SIZE */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hc_size               : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hc_counter            : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HC_SIZE;

/* Define the union U_DB_VY_SIZE */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vy_size               : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    vy_counter            : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_VY_SIZE;

/* Define the union U_DB_MAX_INDEX */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hy_val_idx            : 3   ; /* [2..0]  */
        unsigned int    reserved_0            : 1   ; /* [3]  */
        unsigned int    hy_wgt_idx            : 3   ; /* [6..4]  */
        unsigned int    reserved_1            : 1   ; /* [7]  */
        unsigned int    vy_val_idx            : 3   ; /* [10..8]  */
        unsigned int    reserved_2            : 1   ; /* [11]  */
        unsigned int    vy_wgt_idx            : 3   ; /* [14..12]  */
        unsigned int    reserved_3            : 1   ; /* [15]  */
        unsigned int    hu_val_idx            : 3   ; /* [18..16]  */
        unsigned int    reserved_4            : 1   ; /* [19]  */
        unsigned int    hu_wgt_idx            : 3   ; /* [22..20]  */
        unsigned int    reserved_5            : 1   ; /* [23]  */
        unsigned int    hv_val_idx            : 3   ; /* [26..24]  */
        unsigned int    reserved_6            : 1   ; /* [27]  */
        unsigned int    hv_wgt_idx            : 3   ; /* [30..28]  */
        unsigned int    reserved_7            : 1   ; /* [31]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_MAX_INDEX;

/* Define the union U_DB_HY_SIZE_IDX0 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hy_size_idx0          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hy_counter_idx0       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HY_SIZE_IDX0;

/* Define the union U_DB_HY_SIZE_IDX1 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hy_size_idx1          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hy_counter_idx1       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HY_SIZE_IDX1;

/* Define the union U_DB_HY_SIZE_IDX2 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hy_size_idx2          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hy_counter_idx2       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HY_SIZE_IDX2;

/* Define the union U_DB_HY_SIZE_IDX3 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hy_size_idx3          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hy_counter_idx3       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HY_SIZE_IDX3;

/* Define the union U_DB_HY_SIZE_IDX4 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hy_size_idx4          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hy_counter_idx4       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HY_SIZE_IDX4;

/* Define the union U_DB_HY_SIZE_IDX5 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hy_size_idx5          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hy_counter_idx5       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HY_SIZE_IDX5;

/* Define the union U_DB_HY_SIZE_IDX6 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hy_size_idx6          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hy_counter_idx6       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HY_SIZE_IDX6;

/* Define the union U_DB_HY_SIZE_IDX7 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hy_size_idx7          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hy_counter_idx7       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HY_SIZE_IDX7;

/* Define the union U_DB_VY_SIZE_IDX0 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vy_size_idx0          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    vy_counter_idx0       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_VY_SIZE_IDX0;

/* Define the union U_DB_VY_SIZE_IDX1 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vy_size_idx1          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    vy_counter_idx1       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_VY_SIZE_IDX1;

/* Define the union U_DB_VY_SIZE_IDX2 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vy_size_idx2          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    vy_counter_idx2       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_VY_SIZE_IDX2;

/* Define the union U_DB_VY_SIZE_IDX3 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vy_size_idx3          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    vy_counter_idx3       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_VY_SIZE_IDX3;

/* Define the union U_DB_VY_SIZE_IDX4 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vy_size_idx4          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    vy_counter_idx4       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_VY_SIZE_IDX4;

/* Define the union U_DB_VY_SIZE_IDX5 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vy_size_idx5          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    vy_counter_idx5       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_VY_SIZE_IDX5;

/* Define the union U_DB_VY_SIZE_IDX6 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vy_size_idx6          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    vy_counter_idx6       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_VY_SIZE_IDX6;

/* Define the union U_DB_VY_SIZE_IDX7 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    vy_size_idx7          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    vy_counter_idx7       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_VY_SIZE_IDX7;

/* Define the union U_DB_HU_SIZE_IDX0 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hu_size_idx0          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hu_counter_idx0       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HU_SIZE_IDX0;

/* Define the union U_DB_HU_SIZE_IDX1 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hu_size_idx1          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hu_counter_idx1       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HU_SIZE_IDX1;

/* Define the union U_DB_HU_SIZE_IDX2 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hu_size_idx2          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hu_counter_idx2       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HU_SIZE_IDX2;

/* Define the union U_DB_HU_SIZE_IDX3 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hu_size_idx3          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hu_counter_idx3       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HU_SIZE_IDX3;

/* Define the union U_DB_HU_SIZE_IDX4 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hu_size_idx4          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hu_counter_idx4       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HU_SIZE_IDX4;

/* Define the union U_DB_HU_SIZE_IDX5 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hu_size_idx5          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hu_counter_idx5       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HU_SIZE_IDX5;

/* Define the union U_DB_HU_SIZE_IDX6 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hu_size_idx6          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hu_counter_idx6       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HU_SIZE_IDX6;

/* Define the union U_DB_HU_SIZE_IDX7 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hu_size_idx7          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hu_counter_idx7       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HU_SIZE_IDX7;

/* Define the union U_DB_HV_SIZE_IDX0 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hv_size_idx0          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hv_counter_idx0       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HV_SIZE_IDX0;

/* Define the union U_DB_HV_SIZE_IDX1 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hv_size_idx1          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hv_counter_idx1       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HV_SIZE_IDX1;

/* Define the union U_DB_HV_SIZE_IDX2 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hv_size_idx2          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hv_counter_idx2       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HV_SIZE_IDX2;

/* Define the union U_DB_HV_SIZE_IDX3 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hv_size_idx3          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hv_counter_idx3       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HV_SIZE_IDX3;

/* Define the union U_DB_HV_SIZE_IDX4 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hv_size_idx4          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hv_counter_idx4       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HV_SIZE_IDX4;

/* Define the union U_DB_HV_SIZE_IDX5 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hv_size_idx5          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hv_counter_idx5       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HV_SIZE_IDX5;

/* Define the union U_DB_HV_SIZE_IDX6 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hv_size_idx6          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hv_counter_idx6       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HV_SIZE_IDX6;

/* Define the union U_DB_HV_SIZE_IDX7 */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    hv_size_idx7          : 7   ; /* [6..0]  */
        unsigned int    reserved_0            : 9   ; /* [15..7]  */
        unsigned int    hv_counter_idx7       : 12  ; /* [27..16]  */
        unsigned int    reserved_1            : 4   ; /* [31..28]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_DB_HV_SIZE_IDX7;

/* Define the union U_CCS_2D_GLBCC */
typedef union
{
    /* Define the struct bits */
    struct
    {
        unsigned int    ccs_2d_glbcc          : 20  ; /* [19..0]  */
        unsigned int    reserved_0            : 12  ; /* [31..20]  */
    } bits;

    /* Define an unsigned member */
    unsigned int    u32;

} U_CCS_2D_GLBCC;

/* Define the union U_CCS_2D_RESERVED_0 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_CCS_2D_RESERVED_0;
/* Define the union U_CCS_2D_RESERVED_1 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_CCS_2D_RESERVED_1;
/* Define the union U_CCS_2D_RESERVED_2 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_CCS_2D_RESERVED_2;
/* Define the union U_TNR_NOISEPOINTCNT_MIN */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int noisepointcntmin       : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_TNR_NOISEPOINTCNT_MIN;
/* Define the union U_TNR_NOISEPOINTCNT_MED */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int noisepointcntmed       : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_TNR_NOISEPOINTCNT_MED;
/* Define the union U_TNR_NOISEPOINTCNT_MAX */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int noisepointcntmax       : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_TNR_NOISEPOINTCNT_MAX;
/* Define the union U_TNR_NOISEPOINTNUM */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int noisepointnum          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_TNR_NOISEPOINTNUM;
/* Define the union U_TNR_SUMNOISEINFO_MIN */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int sumnoiseinfomin        : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_TNR_SUMNOISEINFO_MIN;
/* Define the union U_TNR_SUMNOISEINFO_MED */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int sumnoiseinfomed        : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_TNR_SUMNOISEINFO_MED;
/* Define the union U_TNR_SUMNOISEINFO_MAX */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int sumnoiseinfomax        : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_TNR_SUMNOISEINFO_MAX;
/* Define the union U_TNR_SUMNOISEINFO */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int reserved_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_TNR_SUMNOISEINFO;
/* Define the union U_VPSS_PDFRMITDIFF */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int frm_it_diff            : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDFRMITDIFF;
/* Define the union U_VPSS_PDSTLBLKSAD0 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int stlblk_sad002          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDSTLBLKSAD0;
/* Define the union U_VPSS_PDSTLBLKSAD1 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int stlblk_sad012          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDSTLBLKSAD1;
/* Define the union U_VPSS_PDSTLBLKSAD2 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int stlblk_sad022          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDSTLBLKSAD2;
/* Define the union U_VPSS_PDSTLBLKSAD3 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int stlblk_sad032          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDSTLBLKSAD3;
/* Define the union U_VPSS_PDSTLBLKSAD4 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int stlblk_sad102          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDSTLBLKSAD4;
/* Define the union U_VPSS_PDSTLBLKSAD5 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int stlblk_sad112          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDSTLBLKSAD5;
/* Define the union U_VPSS_PDSTLBLKSAD6 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int stlblk_sad122          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDSTLBLKSAD6;
/* Define the union U_VPSS_PDSTLBLKSAD7 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int stlblk_sad132          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDSTLBLKSAD7;
/* Define the union U_VPSS_PDSTLBLKSAD8 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int stlblk_sad202          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDSTLBLKSAD8;
/* Define the union U_VPSS_PDSTLBLKSAD9 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int stlblk_sad212          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDSTLBLKSAD9;
/* Define the union U_VPSS_PDSTLBLKSAD10 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int stlblk_sad222          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDSTLBLKSAD10;
/* Define the union U_VPSS_PDSTLBLKSAD11 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int stlblk_sad232          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDSTLBLKSAD11;
/* Define the union U_VPSS_PDSTLBLKSAD12 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int stlblk_sad302          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDSTLBLKSAD12;
/* Define the union U_VPSS_PDSTLBLKSAD13 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int stlblk_sad312          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDSTLBLKSAD13;
/* Define the union U_VPSS_PDSTLBLKSAD14 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int stlblk_sad322          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDSTLBLKSAD14;
/* Define the union U_VPSS_PDSTLBLKSAD15 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int stlblk_sad332          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDSTLBLKSAD15;
/* Define the union U_VPSS_PDHISTBIN0 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int hist_bin0              : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDHISTBIN0;
/* Define the union U_VPSS_PDHISTBIN1 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int hist_bin1              : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDHISTBIN1;
/* Define the union U_VPSS_PDHISTBIN2 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int hist_bin2              : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDHISTBIN2;
/* Define the union U_VPSS_PDHISTBIN3 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int hist_bin3              : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDHISTBIN3;
/* Define the union U_VPSS_PDUMMATCH0 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int match_um0              : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDUMMATCH0;
/* Define the union U_VPSS_PDUMNOMATCH0 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int nomatch_um0            : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDUMNOMATCH0;
/* Define the union U_VPSS_PDUMMATCH1 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int match_um1              : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDUMMATCH1;
/* Define the union U_VPSS_PDUMNOMATCH1 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int nomatch_um1            : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDUMNOMATCH1;
/* Define the union U_VPSS_PDPCCFFWD0 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int pcc_ffwd_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDPCCFFWD0;
/* Define the union U_VPSS_PDPCCFWD0 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int pcc_fwd_0              : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDPCCFWD0;
/* Define the union U_VPSS_PDPCCBWD0 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int pcc_bwd_0              : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDPCCBWD0;
/* Define the union U_VPSS_PDPCCCRSS0 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int pcc_crss_0             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDPCCCRSS0;
/* Define the union U_VPSS_PDPCCFWDTKR0 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int pcc_fwd_tkr_0          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDPCCFWDTKR0;
/* Define the union U_VPSS_PDPCCBWDTKR0 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int pcc_bwd_tkr_0          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDPCCBWDTKR0;
/* Define the union U_VPSS_PDPCCFFWD1 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int pcc_ffwd_1             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDPCCFFWD1;
/* Define the union U_VPSS_PDPCCFWD1 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int pcc_fwd_1              : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDPCCFWD1;
/* Define the union U_VPSS_PDPCCBWD1 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int pcc_bwd_1              : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDPCCBWD1;
/* Define the union U_VPSS_PDPCCCRSS1 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int pcc_crss_1             : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDPCCCRSS1;
/* Define the union U_VPSS_PDPCCFWDTKR1 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int pcc_fwd_tkr_1          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDPCCFWDTKR1;
/* Define the union U_VPSS_PDPCCBWDTKR1 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int pcc_bwd_tkr_1          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDPCCBWDTKR1;
/* Define the union U_VPSS_PDLASICNT140 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int lasi_14_cnt_0          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDLASICNT140;
/* Define the union U_VPSS_PDLASICNT320 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int lasi_32_cnt_0          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDLASICNT320;
/* Define the union U_VPSS_PDLASICNT340 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int lasi_34_cnt_0          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDLASICNT340;
/* Define the union U_VPSS_PDLASICNT141 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int lasi_14_cnt_1          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDLASICNT141;
/* Define the union U_VPSS_PDLASICNT321 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int lasi_32_cnt_1          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDLASICNT321;
/* Define the union U_VPSS_PDLASICNT341 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int lasi_34_cnt_1          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDLASICNT341;
/* Define the union U_VPSS_PDICHD */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int ichd                   : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_VPSS_PDICHD;
/* Define the union U_iglb_mtn_bin0 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin0          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin0;
/* Define the union U_iglb_mtn_bin1 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin1          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin1;
/* Define the union U_iglb_mtn_bin2 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin2          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin2;
/* Define the union U_iglb_mtn_bin3 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin3          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin3;
/* Define the union U_iglb_mtn_bin4 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin4          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin4;
/* Define the union U_iglb_mtn_bin5 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin5          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin5;
/* Define the union U_iglb_mtn_bin6 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin6          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin6;
/* Define the union U_iglb_mtn_bin7 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin7          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin7;
/* Define the union U_iglb_mtn_bin8 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin8          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin8;
/* Define the union U_iglb_mtn_bin9 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin9          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin9;
/* Define the union U_iglb_mtn_bin10 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin10         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin10;
/* Define the union U_iglb_mtn_bin11 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin11         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin11;
/* Define the union U_iglb_mtn_bin12 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin12         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin12;
/* Define the union U_iglb_mtn_bin13 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin13         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin13;
/* Define the union U_iglb_mtn_bin14 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin14         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin14;
/* Define the union U_iglb_mtn_bin15 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin15         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin15;
/* Define the union U_iglb_mtn_bin16 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin16         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin16;
/* Define the union U_iglb_mtn_bin17 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin17         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin17;
/* Define the union U_iglb_mtn_bin18 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin18         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin18;
/* Define the union U_iglb_mtn_bin19 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin19         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin19;
/* Define the union U_iglb_mtn_bin20 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin20         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin20;
/* Define the union U_iglb_mtn_bin21 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin21         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin21;
/* Define the union U_iglb_mtn_bin22 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin22         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin22;
/* Define the union U_iglb_mtn_bin23 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin23         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin23;
/* Define the union U_iglb_mtn_bin24 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin24         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin24;
/* Define the union U_iglb_mtn_bin25 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin25         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin25;
/* Define the union U_iglb_mtn_bin26 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin26         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin26;
/* Define the union U_iglb_mtn_bin27 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin27         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin27;
/* Define the union U_iglb_mtn_bin28 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin28         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin28;
/* Define the union U_iglb_mtn_bin29 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin29         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin29;
/* Define the union U_iglb_mtn_bin30 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin30         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin30;
/* Define the union U_iglb_mtn_bin31 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_bin31         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_bin31;
/* Define the union U_iglb_mtn_num0 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_num0          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_num0;
/* Define the union U_iglb_mtn_sum0 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_sum0          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_sum0;
/* Define the union U_iglb_mtn_num1 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_num1          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_num1;
/* Define the union U_iglb_mtn_sum1 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_sum1          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_sum1;
/* Define the union U_iglb_mtn_num2 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_num2          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_num2;
/* Define the union U_iglb_mtn_sum2 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_sum2          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_sum2;
/* Define the union U_iglb_mtn_num3 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_num3          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_num3;
/* Define the union U_iglb_mtn_sum3 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_sum3          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_sum3;
/* Define the union U_iglb_mtn_num4 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_num4          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_num4;
/* Define the union U_iglb_mtn_sum4 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb_mtn_sum4          : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb_mtn_sum4;
/* Define the union U_iglb1_mtn_num0 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb1_mtn_num0         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb1_mtn_num0;
/* Define the union U_iglb1_mtn_num1 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb1_mtn_num1         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb1_mtn_num1;
/* Define the union U_iglb1_mtn_num2 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb1_mtn_num2         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb1_mtn_num2;
/* Define the union U_iglb1_mtn_num3 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb1_mtn_num3         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb1_mtn_num3;
/* Define the union U_iglb2_mtn_num0 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb2_mtn_num0         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb2_mtn_num0;
/* Define the union U_iglb2_mtn_num1 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb2_mtn_num1         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb2_mtn_num1;
/* Define the union U_iglb2_mtn_num2 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb2_mtn_num2         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb2_mtn_num2;
/* Define the union U_iglb2_mtn_num3 */
typedef union
{
    /* Define the struct bits  */
    struct
    {
        unsigned int iglb2_mtn_num3         : 32  ; /* [31..0]  */
    } bits;

    /* Define an unsigned member */
        unsigned int    u32;

} U_iglb2_mtn_num3;
//==============================================================================
/* Define the global struct */
typedef struct
{
    U_DB_HY_COUNTER                 DB_HY_COUNTER[2048]              ; /* 0x0~0x1ffc */
    U_DB_BORDER                     DB_BORDER[128]                   ; /* 0x2000~0x21fc */
    U_DB_HY_SIZE                    DB_HY_SIZE                       ; /* 0x2200 */
    U_DB_HC_SIZE                    DB_HC_SIZE                       ; /* 0x2204 */
    U_DB_VY_SIZE                    DB_VY_SIZE                       ; /* 0x2208 */
    U_DB_MAX_INDEX                  DB_MAX_INDEX                     ; /* 0x220c */
    U_DB_HY_SIZE_IDX0               DB_HY_SIZE_IDX0                  ; /* 0x2210 */
    U_DB_HY_SIZE_IDX1               DB_HY_SIZE_IDX1                  ; /* 0x2214 */
    U_DB_HY_SIZE_IDX2               DB_HY_SIZE_IDX2                  ; /* 0x2218 */
    U_DB_HY_SIZE_IDX3               DB_HY_SIZE_IDX3                  ; /* 0x221c */
    U_DB_HY_SIZE_IDX4               DB_HY_SIZE_IDX4                  ; /* 0x2220 */
    U_DB_HY_SIZE_IDX5               DB_HY_SIZE_IDX5                  ; /* 0x2224 */
    U_DB_HY_SIZE_IDX6               DB_HY_SIZE_IDX6                  ; /* 0x2228 */
    U_DB_HY_SIZE_IDX7               DB_HY_SIZE_IDX7                  ; /* 0x222c */
    U_DB_VY_SIZE_IDX0               DB_VY_SIZE_IDX0                  ; /* 0x2230 */
    U_DB_VY_SIZE_IDX1               DB_VY_SIZE_IDX1                  ; /* 0x2234 */
    U_DB_VY_SIZE_IDX2               DB_VY_SIZE_IDX2                  ; /* 0x2238 */
    U_DB_VY_SIZE_IDX3               DB_VY_SIZE_IDX3                  ; /* 0x223c */
    U_DB_VY_SIZE_IDX4               DB_VY_SIZE_IDX4                  ; /* 0x2240 */
    U_DB_VY_SIZE_IDX5               DB_VY_SIZE_IDX5                  ; /* 0x2244 */
    U_DB_VY_SIZE_IDX6               DB_VY_SIZE_IDX6                  ; /* 0x2248 */
    U_DB_VY_SIZE_IDX7               DB_VY_SIZE_IDX7                  ; /* 0x224c */
    U_DB_HU_SIZE_IDX0               DB_HU_SIZE_IDX0                  ; /* 0x2250 */
    U_DB_HU_SIZE_IDX1               DB_HU_SIZE_IDX1                  ; /* 0x2254 */
    U_DB_HU_SIZE_IDX2               DB_HU_SIZE_IDX2                  ; /* 0x2258 */
    U_DB_HU_SIZE_IDX3               DB_HU_SIZE_IDX3                  ; /* 0x225c */
    U_DB_HU_SIZE_IDX4               DB_HU_SIZE_IDX4                  ; /* 0x2260 */
    U_DB_HU_SIZE_IDX5               DB_HU_SIZE_IDX5                  ; /* 0x2264 */
    U_DB_HU_SIZE_IDX6               DB_HU_SIZE_IDX6                  ; /* 0x2268 */
    U_DB_HU_SIZE_IDX7               DB_HU_SIZE_IDX7                  ; /* 0x226c */
    U_DB_HV_SIZE_IDX0               DB_HV_SIZE_IDX0                  ; /* 0x2270 */
    U_DB_HV_SIZE_IDX1               DB_HV_SIZE_IDX1                  ; /* 0x2274 */
    U_DB_HV_SIZE_IDX2               DB_HV_SIZE_IDX2                  ; /* 0x2278 */
    U_DB_HV_SIZE_IDX3               DB_HV_SIZE_IDX3                  ; /* 0x227c */
    U_DB_HV_SIZE_IDX4               DB_HV_SIZE_IDX4                  ; /* 0x2280 */
    U_DB_HV_SIZE_IDX5               DB_HV_SIZE_IDX5                  ; /* 0x2284 */
    U_DB_HV_SIZE_IDX6               DB_HV_SIZE_IDX6                  ; /* 0x2288 */
    U_DB_HV_SIZE_IDX7               DB_HV_SIZE_IDX7                  ; /* 0x228c */
    unsigned int                    reserved_0[28]                   ; /* 0x2290~0x22fc */
    U_CCS_2D_GLBCC                  CCS_2D_GLBCC                     ; /* 0x2300 */
    U_CCS_2D_RESERVED_0             CCS_2D_RESERVED_0                ; /* 0x2304 */
    U_CCS_2D_RESERVED_1             CCS_2D_RESERVED_1                ; /* 0x2308 */
    U_CCS_2D_RESERVED_2             CCS_2D_RESERVED_2                ; /* 0x230c */
    unsigned int                    reserved_1[60]                   ; /* 0x2310~0x23fc */
    U_TNR_NOISEPOINTCNT_MIN         TNR_NOISEPOINTCNT_MIN            ; /* 0x2400 */
    U_TNR_NOISEPOINTCNT_MED         TNR_NOISEPOINTCNT_MED            ; /* 0x2404 */
    U_TNR_NOISEPOINTCNT_MAX         TNR_NOISEPOINTCNT_MAX            ; /* 0x2408 */
    U_TNR_NOISEPOINTNUM             TNR_NOISEPOINTNUM                ; /* 0x240c */
    U_TNR_SUMNOISEINFO_MIN          TNR_SUMNOISEINFO_MIN             ; /* 0x2410 */
    U_TNR_SUMNOISEINFO_MED          TNR_SUMNOISEINFO_MED             ; /* 0x2414 */
    U_TNR_SUMNOISEINFO_MAX          TNR_SUMNOISEINFO_MAX             ; /* 0x2418 */
    U_TNR_SUMNOISEINFO              TNR_SUMNOISEINFO                 ; /* 0x241c */
    unsigned int                    reserved_2[56]                   ; /* 0x2420~0x24fc */
    U_VPSS_PDFRMITDIFF              VPSS_PDFRMITDIFF                 ; /* 0x2500 */
    U_VPSS_PDSTLBLKSAD0             VPSS_PDSTLBLKSAD0                ; /* 0x2504 */
    U_VPSS_PDSTLBLKSAD1             VPSS_PDSTLBLKSAD1                ; /* 0x2508 */
    U_VPSS_PDSTLBLKSAD2             VPSS_PDSTLBLKSAD2                ; /* 0x250c */
    U_VPSS_PDSTLBLKSAD3             VPSS_PDSTLBLKSAD3                ; /* 0x2510 */
    U_VPSS_PDSTLBLKSAD4             VPSS_PDSTLBLKSAD4                ; /* 0x2514 */
    U_VPSS_PDSTLBLKSAD5             VPSS_PDSTLBLKSAD5                ; /* 0x2518 */
    U_VPSS_PDSTLBLKSAD6             VPSS_PDSTLBLKSAD6                ; /* 0x251c */
    U_VPSS_PDSTLBLKSAD7             VPSS_PDSTLBLKSAD7                ; /* 0x2520 */
    U_VPSS_PDSTLBLKSAD8             VPSS_PDSTLBLKSAD8                ; /* 0x2524 */
    U_VPSS_PDSTLBLKSAD9             VPSS_PDSTLBLKSAD9                ; /* 0x2528 */
    U_VPSS_PDSTLBLKSAD10            VPSS_PDSTLBLKSAD10               ; /* 0x252c */
    U_VPSS_PDSTLBLKSAD11            VPSS_PDSTLBLKSAD11               ; /* 0x2530 */
    U_VPSS_PDSTLBLKSAD12            VPSS_PDSTLBLKSAD12               ; /* 0x2534 */
    U_VPSS_PDSTLBLKSAD13            VPSS_PDSTLBLKSAD13               ; /* 0x2538 */
    U_VPSS_PDSTLBLKSAD14            VPSS_PDSTLBLKSAD14               ; /* 0x253c */
    U_VPSS_PDSTLBLKSAD15            VPSS_PDSTLBLKSAD15               ; /* 0x2540 */
    U_VPSS_PDHISTBIN0               VPSS_PDHISTBIN0                  ; /* 0x2544 */
    U_VPSS_PDHISTBIN1               VPSS_PDHISTBIN1                  ; /* 0x2548 */
    U_VPSS_PDHISTBIN2               VPSS_PDHISTBIN2                  ; /* 0x254c */
    U_VPSS_PDHISTBIN3               VPSS_PDHISTBIN3                  ; /* 0x2550 */
    U_VPSS_PDUMMATCH0               VPSS_PDUMMATCH0                  ; /* 0x2554 */
    U_VPSS_PDUMNOMATCH0             VPSS_PDUMNOMATCH0                ; /* 0x2558 */
    U_VPSS_PDUMMATCH1               VPSS_PDUMMATCH1                  ; /* 0x255c */
    U_VPSS_PDUMNOMATCH1             VPSS_PDUMNOMATCH1                ; /* 0x2560 */
    U_VPSS_PDPCCFFWD0               VPSS_PDPCCFFWD0                  ; /* 0x2564 */
    U_VPSS_PDPCCFWD0                VPSS_PDPCCFWD0                   ; /* 0x2568 */
    U_VPSS_PDPCCBWD0                VPSS_PDPCCBWD0                   ; /* 0x256c */
    U_VPSS_PDPCCCRSS0               VPSS_PDPCCCRSS0                  ; /* 0x2570 */
    U_VPSS_PDPCCFWDTKR0             VPSS_PDPCCFWDTKR0                ; /* 0x2574 */
    U_VPSS_PDPCCBWDTKR0             VPSS_PDPCCBWDTKR0                ; /* 0x2578 */
    U_VPSS_PDPCCFFWD1               VPSS_PDPCCFFWD1                  ; /* 0x257c */
    U_VPSS_PDPCCFWD1                VPSS_PDPCCFWD1                   ; /* 0x2580 */
    U_VPSS_PDPCCBWD1                VPSS_PDPCCBWD1                   ; /* 0x2584 */
    U_VPSS_PDPCCCRSS1               VPSS_PDPCCCRSS1                  ; /* 0x2588 */
    U_VPSS_PDPCCFWDTKR1             VPSS_PDPCCFWDTKR1                ; /* 0x258c */
    U_VPSS_PDPCCBWDTKR1             VPSS_PDPCCBWDTKR1                ; /* 0x2590 */
    U_VPSS_PDLASICNT140             VPSS_PDLASICNT140                ; /* 0x2594 */
    U_VPSS_PDLASICNT320             VPSS_PDLASICNT320                ; /* 0x2598 */
    U_VPSS_PDLASICNT340             VPSS_PDLASICNT340                ; /* 0x259c */
    U_VPSS_PDLASICNT141             VPSS_PDLASICNT141                ; /* 0x25a0 */
    U_VPSS_PDLASICNT321             VPSS_PDLASICNT321                ; /* 0x25a4 */
    U_VPSS_PDLASICNT341             VPSS_PDLASICNT341                ; /* 0x25a8 */
    U_VPSS_PDICHD                   VPSS_PDICHD                      ; /* 0x25ac */
    unsigned int                    reserved_3[20]                   ; /* 0x25b0~0x25fc */
    U_iglb_mtn_bin0                 iglb_mtn_bin0                    ; /* 0x2600 */
    U_iglb_mtn_bin1                 iglb_mtn_bin1                    ; /* 0x2604 */
    U_iglb_mtn_bin2                 iglb_mtn_bin2                    ; /* 0x2608 */
    U_iglb_mtn_bin3                 iglb_mtn_bin3                    ; /* 0x260c */
    U_iglb_mtn_bin4                 iglb_mtn_bin4                    ; /* 0x2610 */
    U_iglb_mtn_bin5                 iglb_mtn_bin5                    ; /* 0x2614 */
    U_iglb_mtn_bin6                 iglb_mtn_bin6                    ; /* 0x2618 */
    U_iglb_mtn_bin7                 iglb_mtn_bin7                    ; /* 0x261c */
    U_iglb_mtn_bin8                 iglb_mtn_bin8                    ; /* 0x2620 */
    U_iglb_mtn_bin9                 iglb_mtn_bin9                    ; /* 0x2624 */
    U_iglb_mtn_bin10                iglb_mtn_bin10                   ; /* 0x2628 */
    U_iglb_mtn_bin11                iglb_mtn_bin11                   ; /* 0x262c */
    U_iglb_mtn_bin12                iglb_mtn_bin12                   ; /* 0x2630 */
    U_iglb_mtn_bin13                iglb_mtn_bin13                   ; /* 0x2634 */
    U_iglb_mtn_bin14                iglb_mtn_bin14                   ; /* 0x2638 */
    U_iglb_mtn_bin15                iglb_mtn_bin15                   ; /* 0x263c */
    U_iglb_mtn_bin16                iglb_mtn_bin16                   ; /* 0x2640 */
    U_iglb_mtn_bin17                iglb_mtn_bin17                   ; /* 0x2644 */
    U_iglb_mtn_bin18                iglb_mtn_bin18                   ; /* 0x2648 */
    U_iglb_mtn_bin19                iglb_mtn_bin19                   ; /* 0x264c */
    U_iglb_mtn_bin20                iglb_mtn_bin20                   ; /* 0x2650 */
    U_iglb_mtn_bin21                iglb_mtn_bin21                   ; /* 0x2654 */
    U_iglb_mtn_bin22                iglb_mtn_bin22                   ; /* 0x2658 */
    U_iglb_mtn_bin23                iglb_mtn_bin23                   ; /* 0x265c */
    U_iglb_mtn_bin24                iglb_mtn_bin24                   ; /* 0x2660 */
    U_iglb_mtn_bin25                iglb_mtn_bin25                   ; /* 0x2664 */
    U_iglb_mtn_bin26                iglb_mtn_bin26                   ; /* 0x2668 */
    U_iglb_mtn_bin27                iglb_mtn_bin27                   ; /* 0x266c */
    U_iglb_mtn_bin28                iglb_mtn_bin28                   ; /* 0x2670 */
    U_iglb_mtn_bin29                iglb_mtn_bin29                   ; /* 0x2674 */
    U_iglb_mtn_bin30                iglb_mtn_bin30                   ; /* 0x2678 */
    U_iglb_mtn_bin31                iglb_mtn_bin31                   ; /* 0x267c */
    U_iglb_mtn_num0                 iglb_mtn_num0                    ; /* 0x2680 */
    U_iglb_mtn_sum0                 iglb_mtn_sum0                    ; /* 0x2684 */
    U_iglb_mtn_num1                 iglb_mtn_num1                    ; /* 0x2688 */
    U_iglb_mtn_sum1                 iglb_mtn_sum1                    ; /* 0x268c */
    U_iglb_mtn_num2                 iglb_mtn_num2                    ; /* 0x2690 */
    U_iglb_mtn_sum2                 iglb_mtn_sum2                    ; /* 0x2694 */
    U_iglb_mtn_num3                 iglb_mtn_num3                    ; /* 0x2698 */
    U_iglb_mtn_sum3                 iglb_mtn_sum3                    ; /* 0x269c */
    U_iglb_mtn_num4                 iglb_mtn_num4                    ; /* 0x26a0 */
    U_iglb_mtn_sum4                 iglb_mtn_sum4                    ; /* 0x26a4 */
    U_iglb1_mtn_num0                iglb1_mtn_num0                   ; /* 0x26a8 */
    U_iglb1_mtn_num1                iglb1_mtn_num1                   ; /* 0x26ac */
    U_iglb1_mtn_num2                iglb1_mtn_num2                   ; /* 0x26b0 */
    U_iglb1_mtn_num3                iglb1_mtn_num3                   ; /* 0x26b4 */
    U_iglb2_mtn_num0                iglb2_mtn_num0                   ; /* 0x26b8 */
    U_iglb2_mtn_num1                iglb2_mtn_num1                   ; /* 0x26bc */
    U_iglb2_mtn_num2                iglb2_mtn_num2                   ; /* 0x26c0 */
    U_iglb2_mtn_num3                iglb2_mtn_num3                   ; /* 0x26c4 */

} S_VPSSWB_REGS_TYPE,S_STT_REGS_TYPE,S_VPSS_STT_REGS_TYPE;

/* Declare the struct pointor of the module VPSS_TNR_STT */
extern S_VPSS_STT_REGS_TYPE *gopVPSS_STTAllReg;


#endif /* __VPSS_STT_H__ */
