/*****************************************************************************

    Copyright (C), 2017, Hisilicon Tech. Co., Ltd.

******************************************************************************
  File Name     : ext_sm2.c
  Version       : Initial Draft
  Created       : 2017
  Last Modified :
  Description   :
  Function List :
  History       :
******************************************************************************/
#include "hi_drv_cipher.h"
#include "mbedtls/ecp.h"

#ifdef HI_SM2_SUPPORT

/************************* Internal Structure Definition ********************/
/** \addtogroup      sm2 */
/** @{*/  /** <!-- [sm2]*/

#define SM256R1_P \
    "FFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFF"
#define SM256R1_A \
    "FFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFC"
#define SM256R1_B \
    "28E9FA9E9D9F5E344D5A9E4BCF6509A7F39789F515AB8F92DDBCBD414D940E93"
#define SM256R1_GX \
    "32C4AE2C1F1981195F9904466A39C9948FE30BBFF2660BE1715A4589334C74C7"
#define SM256R1_GY \
    "BC3736A2F4F6779C59BDCEE36B692153D0A9877CC62A474002DF32E52139F0A0"
#define SM256R1_N \
    "FFFFFFFEFFFFFFFFFFFFFFFFFFFFFFFF7203DF6B21C6052B53BBF40939D54123"

const unsigned int sm2n1[SM2_LEN_IN_WROD] = {0xFEFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0x6BDF0372, 0x2B05C621, 0x09F4BB53, 0x2241D539};

#define SM2_TRY_CNT             8
#define SM2_RAND_TRY_CNT        1000

/**
* \brief          print a bignum string of  mbedtls*
*/

int Cipher_printBuffer(const HI_CHAR *string, const unsigned char *pu8Input, unsigned int u32Length);

void mbedtls_mpi_print(const mbedtls_mpi *X, const char *name)
{
#if 0
    int ret;
    size_t n;
    u8 buf[512] = {0};

    n = mbedtls_mpi_size(X);
    MBEDTLS_MPI_CHK(mbedtls_mpi_write_binary(X, buf, n));
    Cipher_printBuffer(name, (u8*)buf, n);

cleanup:
    return;
#endif
}

#define DRV_CIPHER_Rand(x)      rand(x)
#define MPI_PRINT(x)            mbedtls_mpi_print(x, #x)

/** @}*/  /** <!-- ==== Structure Definition end ====*/

/******************************* API Code *****************************/
/** \addtogroup      sm2 drivers*/
/** @{*/  /** <!-- [sm2]*/

static int mbedtls_get_random(void *param, unsigned char *bytes, size_t size)
{
    u32 i;
    u32 randnum = 0;

    for (i=0; i<size; i+=4)
    {
        randnum = DRV_CIPHER_Rand();
        bytes[i+3]   = (HI_U8)(randnum >> 24)& 0xFF;
        bytes[i+2] = (HI_U8)(randnum >> 16)& 0xFF;
        bytes[i+1] = (HI_U8)(randnum >> 8)& 0xFF;
        bytes[i+0] = (HI_U8)(randnum) & 0xFF;
    }

    return HI_SUCCESS;
}

int cryp_sm2_get_randnum(unsigned int randnum[SM2_LEN_IN_WROD], const unsigned int max[SM2_LEN_IN_WROD])
{
    u32 i = 0,j = 0;

    while((i < SM2_LEN_IN_WROD && j < SM2_RAND_TRY_CNT))
    {
        randnum[i] = DRV_CIPHER_Rand();
        if (randnum[i] <= max[i])
        {
            i++;
            j = 0;
        }
        j++;
    }
    if (SM2_RAND_TRY_CNT <= j)
    {
        HI_ERR_CIPHER("Error! SM2 get random number failed!\n");
        return HI_FAILURE;
    }

    return HI_SUCCESS;
}

/*
 * Make group available from embedded constants
 */
static int ecp_group_load_sm2(mbedtls_ecp_group *grp)
{
    int ret;

    MBEDTLS_MPI_CHK(mbedtls_mpi_read_string(&grp->P, 16, SM256R1_P));
    MBEDTLS_MPI_CHK(mbedtls_mpi_read_string(&grp->A, 16, SM256R1_A));
    MBEDTLS_MPI_CHK(mbedtls_mpi_read_string(&grp->B, 16, SM256R1_B));
    MBEDTLS_MPI_CHK(mbedtls_mpi_read_string(&grp->N, 16, SM256R1_N));
    MBEDTLS_MPI_CHK(mbedtls_mpi_read_string(&grp->G.X, 16, SM256R1_GX));
    MBEDTLS_MPI_CHK(mbedtls_mpi_read_string(&grp->G.Y, 16, SM256R1_GY));
    MBEDTLS_MPI_CHK(mbedtls_mpi_lset(&grp->G.Z, 1));
    grp->pbits = mbedtls_mpi_bitlen(&grp->P);
    grp->nbits = mbedtls_mpi_bitlen(&grp->N);

    grp->h = 0;

cleanup:
    return(ret);

}

/*
 * Derive a suitable integer for group grp from a buffer of length len
 * SEC1 4.1.3 step 5 aka SEC1 4.1.4 step 3
 */
static int derive_mpi(const mbedtls_ecp_group *grp, mbedtls_mpi *x,
                       const unsigned char *buf, size_t blen)
{
    int ret;
    size_t n_size = (grp->nbits + 7) / 8;
    size_t use_size = blen > n_size ? n_size : blen;

    MBEDTLS_MPI_CHK(mbedtls_mpi_read_binary(x, buf, use_size));
    if (use_size * 8 > grp->nbits)
        MBEDTLS_MPI_CHK(mbedtls_mpi_shift_r(x, use_size * 8 - grp->nbits));

    /* While at it, reduce modulo N */
    if (mbedtls_mpi_cmp_mpi(x, &grp->N) >= 0)
        MBEDTLS_MPI_CHK(mbedtls_mpi_sub_mpi(x, x, &grp->N));

cleanup:
    return(ret);
}

static int sm2_sign(mbedtls_mpi *r, mbedtls_mpi *s, mbedtls_mpi *d, /*Private Key*/
              unsigned char *buf, size_t blen,
              int (*f_rng)(void *, unsigned char *, size_t), void *p_rng)
{
    int ret = HI_FAILURE;
    int key_tries = 0;
    int sign_tries = 0;
    mbedtls_ecp_group grp;
    mbedtls_ecp_point R;
    mbedtls_mpi k;
    mbedtls_mpi e;
    mbedtls_mpi rk;
    mbedtls_mpi mdA;
    mbedtls_mpi inv;

    if ((buf == NULL) || (blen == 0))
    {
        HI_ERR_CIPHER("Invalid param\n");
        return HI_FAILURE;
    }
    if (mbedtls_mpi_cmp_int(d, 0) == 0)
    {
        HI_ERR_CIPHER("Invalid param\n");
        return HI_FAILURE;
    }

    mbedtls_mpi_init(&k);
    mbedtls_mpi_init(&e);
    mbedtls_mpi_init(&rk);
    mbedtls_mpi_init(&mdA);
    mbedtls_mpi_init(&inv);
    mbedtls_ecp_group_init(&grp);
    mbedtls_ecp_point_init(&R);
    MBEDTLS_MPI_CHK(ecp_group_load_sm2(&grp));

    do
    {
        /*Steps 1: generate a randnum k, 1<=k<=n-1*/
        MBEDTLS_MPI_CHK(mbedtls_mpi_fill_random(&k,  mbedtls_mpi_size(&grp.N), f_rng, p_rng));
        //mbedtls_mpi_print (&k, " k");

       /*Step 2: compute R = [k]G*/
        MBEDTLS_MPI_CHK(mbedtls_ecp_mul(&grp, &R, &k, &grp.G, NULL, NULL));

       /*Step 3: derive MPI from hashed message*/
        MBEDTLS_MPI_CHK(derive_mpi(&grp, &e, buf, blen));

        /*Step 4: compute r = e + Rx mod n*/
        MBEDTLS_MPI_CHK(mbedtls_mpi_add_mpi(r, &e, &R.X));
        MBEDTLS_MPI_CHK(mbedtls_mpi_mod_mpi(r, r, &grp.N));

        if (key_tries++ > 10)
        {
            ret = MBEDTLS_ERR_ECP_RANDOM_FAILED;
            goto cleanup;
        }

        if (mbedtls_mpi_cmp_int(r, 0) == 0)
        {
            continue;
        }

        /*Step 5: compute rk = r + k mod n*/
        MBEDTLS_MPI_CHK(mbedtls_mpi_add_mpi(&rk, r, &k));

        if (mbedtls_mpi_cmp_int(&rk, 0) == 0)
        {
            continue;
        }

        /*Step 6: compute mdA = k - r.dA*/
        MBEDTLS_MPI_CHK(mbedtls_mpi_mul_mpi(&mdA, r, d));
        MBEDTLS_MPI_CHK(mbedtls_mpi_sub_mpi(&mdA, &k, &mdA));

        /*Step 7: compute inv = (1 + dA)^-1 mod n*/
        MBEDTLS_MPI_CHK(mbedtls_mpi_add_int(&inv, d, 1));
        MBEDTLS_MPI_CHK(mbedtls_mpi_inv_mod(&inv, &inv, &grp.N));

        /* Step 8: compute s = inv * mdA mod n*/
        MBEDTLS_MPI_CHK(mbedtls_mpi_mul_mpi(s, &inv, &mdA));
        MBEDTLS_MPI_CHK(mbedtls_mpi_mod_mpi(s, s, &grp.N));

        if (sign_tries++ > 10)
        {
            ret = MBEDTLS_ERR_ECP_RANDOM_FAILED;
            goto cleanup;
        }
    }
    while (mbedtls_mpi_cmp_int(s, 0) == 0);

cleanup:
    mbedtls_mpi_free(&k);
    mbedtls_mpi_free(&e);
    mbedtls_mpi_free(&rk);
    mbedtls_mpi_free(&mdA);
    mbedtls_mpi_free(&inv);
    mbedtls_ecp_point_free(&R);
    mbedtls_ecp_group_free(&grp);

    return(ret);
}

static int sm2_verify(unsigned char *buf, size_t blen, mbedtls_ecp_point *Q, /*Public key*/
                mbedtls_mpi *r, mbedtls_mpi *s)
{
    int ret;
    mbedtls_mpi e, t, R;
    mbedtls_ecp_point P;
    mbedtls_ecp_group grp;

    if (mbedtls_ecp_is_zero(Q))
    {
        HI_ERR_CIPHER("Invalid param\n");
        return HI_FAILURE;
    }
    if (mbedtls_mpi_cmp_int(r, 0) == 0)
    {
        HI_ERR_CIPHER("Invalid param\n");
        return HI_FAILURE;
    }
    if (mbedtls_mpi_cmp_int(s, 0) == 0)
    {
        HI_ERR_CIPHER("Invalid param\n");
        return HI_FAILURE;
    }

    mbedtls_mpi_init(&e);
    mbedtls_mpi_init(&t);
    mbedtls_mpi_init(&R);
    mbedtls_ecp_group_init(&grp);
    mbedtls_ecp_point_init(&P);

    MBEDTLS_MPI_CHK(ecp_group_load_sm2(&grp));
    MBEDTLS_MPI_CHK(mbedtls_mpi_read_binary (&e, buf, blen));

    /*
     * Step 1: make sure r and s are in range 1..n-1
     */
    if (mbedtls_mpi_cmp_int(r, 1) < 0 || mbedtls_mpi_cmp_mpi(r, &grp.N) >= 0 ||
        mbedtls_mpi_cmp_int(s, 1) < 0 || mbedtls_mpi_cmp_mpi(s, &grp.N) >= 0)
    {
        ret = MBEDTLS_ERR_ECP_BAD_INPUT_DATA;
        goto cleanup;
    }

    /*
     * Additional precaution: make sure Q is valid
     */
    MBEDTLS_MPI_CHK(mbedtls_ecp_check_pubkey(&grp, Q));

    /*
     * Step 3: derive MPI from hashed message
     */
    MBEDTLS_MPI_CHK(derive_mpi(&grp, &e, buf, blen));

    /*
     * Step 4: t = (r+s) mod n
     */
    MBEDTLS_MPI_CHK(mbedtls_mpi_add_mpi(&t, r, s));
    MBEDTLS_MPI_CHK(mbedtls_mpi_mod_mpi(&t, &t, &grp.N));

    /*
     * Step 5: P = [s]G + [t]Q
     *
     * Since we're not using any secret data, no need to pass a RNG to
     * mbedtls_ecp_mul() for countermesures.
     */
    MBEDTLS_MPI_CHK(mbedtls_ecp_muladd(&grp, &P, s, &grp.G, &t, Q));

    if (mbedtls_ecp_is_zero(&P))
    {
        ret = MBEDTLS_ERR_ECP_VERIFY_FAILED;
        goto cleanup;
    }

    /*
     * Step 6: convert xR to an integer (no-op)
     * Step 7: R = (e+Px) mod n
     */
    MBEDTLS_MPI_CHK(mbedtls_mpi_add_mpi(&R, &e, &P.X));
    MBEDTLS_MPI_CHK(mbedtls_mpi_mod_mpi(&R, &R, &grp.N));

    /*
     * Step 8: check if v (that is, R.X) is equal to r
     */
    if (mbedtls_mpi_cmp_mpi(&R, r) != 0)
    {
        ret = MBEDTLS_ERR_ECP_VERIFY_FAILED;
        goto cleanup;
    }

cleanup:

    mbedtls_mpi_free(&e);
    mbedtls_mpi_free(&t);
    mbedtls_mpi_free(&R);
    mbedtls_ecp_point_free(&P);
    mbedtls_ecp_group_free(&grp);

    return(ret);
}

/*k¡Ê[1,n-1], R = [k]G, Z = [k]Q*/
static int sm2_encrypt(mbedtls_ecp_point *Z, mbedtls_ecp_point *Q, /*Public key*/ mbedtls_ecp_point *R,
                 int (*f_rng)(void *, unsigned char *, size_t), void *p_rng)
{
    int ret;
    int key_tries = 0;
    mbedtls_mpi k;
    mbedtls_ecp_group grp;

    if (mbedtls_ecp_is_zero(Q))
    {
        HI_ERR_CIPHER("Invalid param\n");
        return HI_FAILURE;
    }

    mbedtls_mpi_init(&k);
    mbedtls_ecp_group_init(&grp);

    MBEDTLS_MPI_CHK(ecp_group_load_sm2(&grp));

    do
    {
        if (SM2_TRY_CNT < key_tries++)
        {
            ret = MBEDTLS_ERR_ECP_RANDOM_FAILED;
            goto cleanup;
        }

        /*
         * Steps 1: generate a randnum k, 1<=k<=n-1
         */
        MBEDTLS_MPI_CHK(mbedtls_mpi_fill_random(&k,  mbedtls_mpi_size(&grp.N), f_rng, p_rng));
//        mbedtls_mpi_print (&k, " k");

        /*
         * Step 2: compute R = [k]G
         */
        MBEDTLS_MPI_CHK(mbedtls_ecp_mul(&grp, R, &k, &grp.G, NULL, NULL));
        if (mbedtls_ecp_is_zero(R))
        {
            continue;
        }

        /*
         * Additional precaution: make sure Q is valid
         */
        MBEDTLS_MPI_CHK(mbedtls_ecp_check_pubkey(&grp, Q));

        /*
         * Step 3: compute Z = [k]Q
         */
        MBEDTLS_MPI_CHK(mbedtls_ecp_mul(&grp, Z, &k, Q, NULL, NULL));

    }
    while(mbedtls_ecp_is_zero(Z));

cleanup:

    mbedtls_mpi_free(&k);
    mbedtls_ecp_group_free(&grp);

    return(ret);
}

/*Z = [d]R*/
static int sm2_decrypt(mbedtls_ecp_point *Z, mbedtls_mpi *d, /*Private key*/ mbedtls_ecp_point *R)
{
    int ret;
    mbedtls_mpi u1, u2;
    mbedtls_ecp_group grp;

    if (mbedtls_mpi_cmp_int(d, 0) == 0)
    {
        HI_ERR_CIPHER("Invalid param\n");
        return HI_FAILURE;
    }

    if (mbedtls_ecp_is_zero(R))
    {
        HI_ERR_CIPHER("Invalid param\n");
        return HI_FAILURE;
    }

    mbedtls_mpi_init(&u1);
    mbedtls_mpi_init(&u2);
    mbedtls_ecp_group_init(&grp);

    MBEDTLS_MPI_CHK(ecp_group_load_sm2(&grp));

    /*
     * Steps 1: check Ry^2=Rx^3+aRx+b ?
     *          u1 = Rx*Rx, u1 = u1 * Rx, u2 = aRx,
     *          u1 = u1 + u2, u1 = u1 + b
     *          u2 = Ry*Ry
     *          u1 = u1 mod p, u2 = u2 mod p, u1 == u2 ?
     */

    MBEDTLS_MPI_CHK(mbedtls_mpi_mul_mpi(&u1, &R->X, &R->X));  //u1 = Rx*Rx
    MBEDTLS_MPI_CHK(mbedtls_mpi_mul_mpi(&u1, &u1, &R->X));    //u1 = u1 * Rx
    MBEDTLS_MPI_CHK(mbedtls_mpi_mul_mpi(&u2, &grp.A, &R->X));//u2 = aRx
    MBEDTLS_MPI_CHK(mbedtls_mpi_add_mpi(&u1, &u1, &u2));      //u1 = u1 + u2
    MBEDTLS_MPI_CHK(mbedtls_mpi_add_mpi(&u1, &u1, &grp.B));  //u1 = u1 + b
    MBEDTLS_MPI_CHK(mbedtls_mpi_mul_mpi(&u2, &R->Y, &R->Y));  //u2 = Ry*Ry
    MBEDTLS_MPI_CHK(mbedtls_mpi_mod_mpi(&u1, &u1, &grp.P));  //u1 = u1 mod p
    MBEDTLS_MPI_CHK(mbedtls_mpi_mod_mpi(&u2, &u2, &grp.P));  //u2 = u2 mod p
    if (mbedtls_mpi_cmp_mpi(&u1, &u2) != 0)
    {
        ret = MBEDTLS_ERR_ECP_BAD_INPUT_DATA;
        goto cleanup;
    }

    /*
     * Step 2: compute Z = [d]R
     */
    MBEDTLS_MPI_CHK(mbedtls_ecp_mul(&grp, Z, d, R, NULL, NULL));
    if (mbedtls_ecp_is_zero(Z))
    {
        ret = MBEDTLS_ERR_ECP_BAD_INPUT_DATA;
        goto cleanup;
    }

cleanup:
    mbedtls_ecp_group_free(&grp);
    mbedtls_mpi_free(&u1);
    mbedtls_mpi_free(&u2);

    return(ret);
}

int mbedtls_sm2_sign(unsigned int e[SM2_LEN_IN_WROD], unsigned int d[SM2_LEN_IN_WROD],
                     unsigned int r[SM2_LEN_IN_WROD], unsigned int s[SM2_LEN_IN_WROD])
{
    int ret = HI_FAILURE;
    mbedtls_mpi md;
    mbedtls_mpi mr;
    mbedtls_mpi ms;

    mbedtls_mpi_init(&md);
    mbedtls_mpi_init(&mr);
    mbedtls_mpi_init(&ms);

    MBEDTLS_MPI_CHK(mbedtls_mpi_read_binary (&md, (HI_U8*)d, SM2_LEN_IN_BYTE));
    MBEDTLS_MPI_CHK(sm2_sign (&mr, &ms, &md, (unsigned char*)e, SM2_LEN_IN_BYTE,
        mbedtls_get_random, HI_NULL));
    MBEDTLS_MPI_CHK(mbedtls_mpi_write_binary (&mr, (unsigned char*)r, SM2_LEN_IN_BYTE));
    MBEDTLS_MPI_CHK(mbedtls_mpi_write_binary (&ms, (unsigned char*)s, SM2_LEN_IN_BYTE));

cleanup:
    mbedtls_mpi_free(&md);
    mbedtls_mpi_free(&mr);
    mbedtls_mpi_free(&ms);

    return ret;
}

/***************************************
  1. t=(r+s)mod n, if t==0, return fail
  2. (x1,y1)=[s]G+tP,
  3. r=(e+x1)mod n, if r==R, return pass
****************************************/
static int mbedtls_sm2_verify(unsigned int e[SM2_LEN_IN_WROD],
                       unsigned int px[SM2_LEN_IN_WROD],unsigned int py[SM2_LEN_IN_WROD],
                       unsigned int r[SM2_LEN_IN_WROD], unsigned int s[SM2_LEN_IN_WROD])
{
    int ret = HI_FAILURE;
    mbedtls_mpi mr;
    mbedtls_mpi ms;
    mbedtls_ecp_point Q;

    mbedtls_mpi_init(&mr);
    mbedtls_mpi_init(&ms);
    mbedtls_ecp_point_init(&Q);

    MBEDTLS_MPI_CHK(mbedtls_mpi_read_binary(&mr, (unsigned char*)r, SM2_LEN_IN_BYTE));
    MBEDTLS_MPI_CHK(mbedtls_mpi_read_binary(&ms, (unsigned char*)s, SM2_LEN_IN_BYTE));
    MBEDTLS_MPI_CHK(mbedtls_mpi_read_binary(&Q.X, (HI_U8*)px, SM2_LEN_IN_BYTE));
    MBEDTLS_MPI_CHK(mbedtls_mpi_read_binary(&Q.Y, (HI_U8*)py, SM2_LEN_IN_BYTE));
    MBEDTLS_MPI_CHK(mbedtls_mpi_lset(&Q.Z, 1));
    MBEDTLS_MPI_CHK(sm2_verify((unsigned char*)e, SM2_LEN_IN_BYTE, &Q, &mr, &ms));

cleanup:
    mbedtls_mpi_free(&mr);
    mbedtls_mpi_free(&ms);
    mbedtls_ecp_point_free(&Q);

    return ret;
}

/* Compute C1(x, y) = k * G(x, y), XY = k * P(x, y)*/
static int mbedtls_sm2_encrypt(unsigned int px[SM2_LEN_IN_WROD], unsigned int py[SM2_LEN_IN_WROD],
                        unsigned int c1x[SM2_LEN_IN_WROD], unsigned int c1y[SM2_LEN_IN_WROD],
                        unsigned int x2[SM2_LEN_IN_WROD], unsigned int y2[SM2_LEN_IN_WROD])
{
    int ret = HI_SUCCESS;
    mbedtls_ecp_point Q;
    mbedtls_ecp_point R;
    mbedtls_ecp_point Z;

    mbedtls_ecp_point_init(&Q);
    mbedtls_ecp_point_init(&Z);
    mbedtls_ecp_point_init(&R);

    MBEDTLS_MPI_CHK(mbedtls_mpi_read_binary(&Q.X, (HI_U8*)px, SM2_LEN_IN_BYTE));
    MBEDTLS_MPI_CHK(mbedtls_mpi_read_binary(&Q.Y, (HI_U8*)py, SM2_LEN_IN_BYTE));
    MBEDTLS_MPI_CHK(mbedtls_mpi_lset(&Q.Z, 1));

    MBEDTLS_MPI_CHK(sm2_encrypt (&Z, &Q, &R, mbedtls_get_random, HI_NULL));

    MBEDTLS_MPI_CHK(mbedtls_mpi_write_binary(&R.X, (HI_U8*)c1x, SM2_LEN_IN_BYTE));
    MBEDTLS_MPI_CHK(mbedtls_mpi_write_binary(&R.Y, (HI_U8*)c1y, SM2_LEN_IN_BYTE));

    MBEDTLS_MPI_CHK(mbedtls_mpi_write_binary(&Z.X, (HI_U8*)x2, SM2_LEN_IN_BYTE));
    MBEDTLS_MPI_CHK(mbedtls_mpi_write_binary(&Z.Y, (HI_U8*)y2, SM2_LEN_IN_BYTE));

cleanup:
    mbedtls_ecp_point_free(&Q);
    mbedtls_ecp_point_free(&R);
    mbedtls_ecp_point_free(&Z);

    return ret;
}

/*Compute M(x, y) = C1(x, y) * d*/
static int mbedtls_sm2_decrypt(unsigned int d[SM2_LEN_IN_WROD],
                        unsigned int c1x[SM2_LEN_IN_WROD], unsigned int c1y[SM2_LEN_IN_WROD],
                        unsigned int x2[SM2_LEN_IN_WROD], unsigned int y2[SM2_LEN_IN_WROD])
{
    int ret = HI_SUCCESS;
    mbedtls_mpi md;
    mbedtls_ecp_point R;
    mbedtls_ecp_point Z;

    mbedtls_mpi_init(&md);
    mbedtls_ecp_point_init(&Z);
    mbedtls_ecp_point_init(&R);

    MBEDTLS_MPI_CHK(mbedtls_mpi_read_binary (&md, (HI_U8*)d, SM2_LEN_IN_BYTE));

    /*Import unsigned char array C1 ro point R*/
    MBEDTLS_MPI_CHK(mbedtls_mpi_read_binary (&R.X, (HI_U8*)c1x, SM2_LEN_IN_BYTE));
    MBEDTLS_MPI_CHK(mbedtls_mpi_read_binary (&R.Y, (HI_U8*)c1y, SM2_LEN_IN_BYTE));
    MBEDTLS_MPI_CHK(mbedtls_mpi_lset(&R.Z, 1));

    /*compute Z = [d]R*/
    MBEDTLS_MPI_CHK(sm2_decrypt(&Z, &md, &R));

    /*Export R to unsigned char array C1(x2,y2)*/
    MBEDTLS_MPI_CHK(mbedtls_mpi_write_binary(&Z.X, (HI_U8*)x2, SM2_LEN_IN_BYTE));
    MBEDTLS_MPI_CHK(mbedtls_mpi_write_binary(&Z.Y, (HI_U8*)y2, SM2_LEN_IN_BYTE));

 cleanup:
    mbedtls_mpi_free(&md);
    mbedtls_ecp_point_free(&R);
    mbedtls_ecp_point_free(&Z);

    return ret;
}

/*Compute P(x,y) = d * G(x,y)*/
static int mbedtls_sm2_gen_key(unsigned int d[SM2_LEN_IN_WROD],
                        unsigned int px[SM2_LEN_IN_WROD], unsigned int py[SM2_LEN_IN_WROD])
{
    int ret = HI_SUCCESS;
    mbedtls_ecp_group grp;
    mbedtls_ecp_point Q;
    mbedtls_mpi m;
    unsigned int i = 0,j = 0;
    unsigned int random[SM2_TRY_CNT][SM2_LEN_IN_WROD];

    mbedtls_mpi_init(&m);
    mbedtls_ecp_point_init(&Q);
    mbedtls_ecp_group_init(&grp);

    MBEDTLS_MPI_CHK(ecp_group_load_sm2(&grp));

    HI_INFO_CIPHER ("Step 1. generate randnum d, 1<=k<=n-2");
    for (i=0; i<SM2_TRY_CNT; i++)
    {
        MBEDTLS_MPI_CHK(cryp_sm2_get_randnum(random[i], sm2n1));
    }
    j = DRV_CIPHER_Rand();
    j %= SM2_TRY_CNT;
    memcpy(d, random[j], SM2_LEN_IN_BYTE);

    HI_INFO_CIPHER ("Step 2. PA=dA*G");

    /*
     * Step 2: P = d * G
     */
    MBEDTLS_MPI_CHK(mbedtls_mpi_read_binary(&m, (HI_U8*)d, SM2_LEN_IN_BYTE));
    MBEDTLS_MPI_CHK(mbedtls_ecp_mul(&grp, &Q, &m, &grp.G, NULL, NULL));
    if (mbedtls_ecp_is_zero(&Q))
    {
        ret = MBEDTLS_ERR_ECP_BAD_INPUT_DATA;
        goto cleanup;
    }

    MBEDTLS_MPI_CHK(mbedtls_mpi_write_binary(&Q.X, (HI_U8*)px, SM2_LEN_IN_BYTE));
    MBEDTLS_MPI_CHK(mbedtls_mpi_write_binary(&Q.Y, (HI_U8*)py, SM2_LEN_IN_BYTE));
    MBEDTLS_MPI_CHK(mbedtls_mpi_lset(&Q.Z, 1));

cleanup:
    mbedtls_mpi_free(&m);
    mbedtls_ecp_point_free(&Q);
    mbedtls_ecp_group_free(&grp);

    return ret;
}

HI_S32 DRV_SM2_Init(HI_VOID)
{
    return HI_SUCCESS;
}

HI_VOID DRV_SM2_DeInit(HI_VOID)
{

}

HI_S32 HI_DRV_SM2_Sign(SM2_SIGN_DATA_S *pSm2SignData)
{
    HI_S32 ret = HI_FAILURE;

    dcache_enable(0);

    ret = mbedtls_sm2_sign(pSm2SignData->u32e, pSm2SignData->u32d, pSm2SignData->u32r, pSm2SignData->u32s);

    dcache_disable();

    return ret;
}

HI_S32 HI_DRV_SM2_Verify(SM2_VERIFY_DATA_S *pSm2VerifyData)
{
    HI_S32 ret = HI_FAILURE;

    dcache_enable(0);

    ret = mbedtls_sm2_verify(pSm2VerifyData->u32e, pSm2VerifyData->u32Px, pSm2VerifyData->u32Py,
        pSm2VerifyData->u32r, pSm2VerifyData->u32s);

    dcache_disable();

    return ret;
}

HI_S32 HI_DRV_SM2_Encrypt(SM2_ENC_DATA_S *pSm2EncData)
{
    HI_S32 ret = HI_FAILURE;

    dcache_enable(0);

    ret = mbedtls_sm2_encrypt(pSm2EncData->u32Px, pSm2EncData->u32Py, pSm2EncData->u32C1x,
        pSm2EncData->u32C1y, pSm2EncData->u32X2, pSm2EncData->u32Y2);

    dcache_disable();

    return ret;
}

HI_S32 HI_DRV_SM2_Decrypt(SM2_DEC_DATA_S *pSm2DecData)
{
    HI_S32 ret = HI_FAILURE;

    dcache_enable(0);

    ret =  mbedtls_sm2_decrypt(pSm2DecData->u32d, pSm2DecData->u32C1x,
        pSm2DecData->u32C1y, pSm2DecData->u32X2, pSm2DecData->u32Y2);

    dcache_disable();

    return ret;
}

HI_S32 HI_DRV_SM2_Key(SM2_KEY_DATA_S *pSm2KeyData)
{
    HI_S32 ret = HI_FAILURE;

    dcache_enable(0);

    ret = mbedtls_sm2_gen_key(pSm2KeyData->u32d, pSm2KeyData->u32Px, pSm2KeyData->u32Py);

    dcache_disable();

    return ret;
}

#endif
