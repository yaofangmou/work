#include "vdp_gen_coef.h"
#if EDA_TEST
#include "vdp_fun.h"
#include "vdp_sti.h"
#endif

HI_U32 VDP_DRV_GenCoef(VDP_DRV_COEF_GEN_CFG* stCfg)
{
    HI_U32 ii=0;
    HI_S32 tmp_data=0;

    if(stCfg->coef_data_mode == VDP_RM_COEF_MODE_TYP)
    {
        if(stCfg->coef_data_type == COEF_DATA_TYPE_U8)
        {
            for(ii=0;ii<stCfg->length;ii++)
            {
                ((HI_U8*)stCfg->p_coef_new)[ii] = ((HI_U8*)stCfg->p_coef)[ii];
            }
        }
        else if(stCfg->coef_data_type == COEF_DATA_TYPE_S8)
        {
            for(ii=0;ii<stCfg->length;ii++)
            {
                ((HI_S8*)stCfg->p_coef_new)[ii] = ((HI_S8*)stCfg->p_coef)[ii];
            }

        }
        else if(stCfg->coef_data_type == COEF_DATA_TYPE_U16)
        {
            for(ii=0;ii<stCfg->length;ii++)
            {
                ((HI_U16*)stCfg->p_coef_new)[ii] = ((HI_U16*)stCfg->p_coef)[ii];
            }

        }
        else if(stCfg->coef_data_type == COEF_DATA_TYPE_S16)
        {
            for(ii=0;ii<stCfg->length;ii++)
            {
                ((HI_S16*)stCfg->p_coef_new)[ii] = ((HI_S16*)stCfg->p_coef)[ii];
            }

        }
        else if(stCfg->coef_data_type == COEF_DATA_TYPE_U32)
        {
            for(ii=0;ii<stCfg->length;ii++)
            {
                ((HI_U32*)stCfg->p_coef_new)[ii] = ((HI_U32*)stCfg->p_coef)[ii];
            }

        }
        else if(stCfg->coef_data_type == COEF_DATA_TYPE_S32)
        {
            for(ii=0;ii<stCfg->length;ii++)
            {
                ((HI_S32*)stCfg->p_coef_new)[ii] = ((HI_S32*)stCfg->p_coef)[ii];
            }

        }

    }
    else if(stCfg->coef_data_mode == VDP_RM_COEF_MODE_ZRO)
    {
        if(stCfg->coef_data_type == COEF_DATA_TYPE_U8)
        {
            for(ii=0;ii<stCfg->length;ii++)
            {
                tmp_data = 0;
                ((HI_U8*)stCfg->p_coef_new)[ii] = tmp_data;
            }
        }
        else if(stCfg->coef_data_type == COEF_DATA_TYPE_S8)
        {
            for(ii=0;ii<stCfg->length;ii++)
            {
                tmp_data = 0;
                ((HI_S8*)stCfg->p_coef_new)[ii] = tmp_data;
            }

        }
        else if(stCfg->coef_data_type == COEF_DATA_TYPE_U16)
        {
            for(ii=0;ii<stCfg->length;ii++)
            {
                tmp_data = 0;
                ((HI_U16*)stCfg->p_coef_new)[ii] = tmp_data;
            }

        }
        else if(stCfg->coef_data_type == COEF_DATA_TYPE_S16)
        {
            for(ii=0;ii<stCfg->length;ii++)
            {
                tmp_data = 0;
                ((HI_S16*)stCfg->p_coef_new)[ii] = tmp_data;
            }

        }
        else if(stCfg->coef_data_type == COEF_DATA_TYPE_U32)
        {
            for(ii=0;ii<stCfg->length;ii++)
            {
                tmp_data = 0;
                ((HI_U32*)stCfg->p_coef_new)[ii] = tmp_data;
            }

        }
        else if(stCfg->coef_data_type == COEF_DATA_TYPE_S32)
        {
            for(ii=0;ii<stCfg->length;ii++)
            {
                tmp_data = 0;
                ((HI_S32*)stCfg->p_coef_new)[ii] = tmp_data;
            }

        }

    }
    else if(stCfg->coef_data_mode == VDP_RM_COEF_MODE_MIN)
    {
        if(stCfg->coef_data_type == COEF_DATA_TYPE_U8)
        {
            for(ii=0;ii<stCfg->length;ii++)
            {
                tmp_data = stCfg->coef_min;
                ((HI_U8*)stCfg->p_coef_new)[ii] = tmp_data;
            }
        }
        else if(stCfg->coef_data_type == COEF_DATA_TYPE_S8)
        {
            for(ii=0;ii<stCfg->length;ii++)
            {
                tmp_data = stCfg->coef_min;
                ((HI_S8*)stCfg->p_coef_new)[ii] = tmp_data;
            }

        }
        else if(stCfg->coef_data_type == COEF_DATA_TYPE_U16)
        {
            for(ii=0;ii<stCfg->length;ii++)
            {
                tmp_data = stCfg->coef_min;
                ((HI_U16*)stCfg->p_coef_new)[ii] = tmp_data;
            }

        }
        else if(stCfg->coef_data_type == COEF_DATA_TYPE_S16)
        {
            for(ii=0;ii<stCfg->length;ii++)
            {
                tmp_data = stCfg->coef_min;
                ((HI_S16*)stCfg->p_coef_new)[ii] = tmp_data;
            }

        }
        else if(stCfg->coef_data_type == COEF_DATA_TYPE_U32)
        {
            for(ii=0;ii<stCfg->length;ii++)
            {
                tmp_data = stCfg->coef_min;
                ((HI_U32*)stCfg->p_coef_new)[ii] = tmp_data;
            }

        }
        else if(stCfg->coef_data_type == COEF_DATA_TYPE_S32)
        {
            for(ii=0;ii<stCfg->length;ii++)
            {
                tmp_data = stCfg->coef_min;
                ((HI_S32*)stCfg->p_coef_new)[ii] = tmp_data;
            }

        }

    }
    else if(stCfg->coef_data_mode == VDP_RM_COEF_MODE_MAX)
    {
        if(stCfg->coef_data_type == COEF_DATA_TYPE_U8)
        {
            for(ii=0;ii<stCfg->length;ii++)
            {
                tmp_data = stCfg->coef_max;
                ((HI_U8*)stCfg->p_coef_new)[ii] = tmp_data;
            }
        }
        else if(stCfg->coef_data_type == COEF_DATA_TYPE_S8)
        {
            for(ii=0;ii<stCfg->length;ii++)
            {
                tmp_data = stCfg->coef_max;
                ((HI_S8*)stCfg->p_coef_new)[ii] = tmp_data;
            }

        }
        else if(stCfg->coef_data_type == COEF_DATA_TYPE_U16)
        {
            for(ii=0;ii<stCfg->length;ii++)
            {
                tmp_data = stCfg->coef_max;
                ((HI_U16*)stCfg->p_coef_new)[ii] = tmp_data;
            }

        }
        else if(stCfg->coef_data_type == COEF_DATA_TYPE_S16)
        {
            for(ii=0;ii<stCfg->length;ii++)
            {
                tmp_data = stCfg->coef_max;
                ((HI_S16*)stCfg->p_coef_new)[ii] = tmp_data;
            }

        }
        else if(stCfg->coef_data_type == COEF_DATA_TYPE_U32)
        {
            for(ii=0;ii<stCfg->length;ii++)
            {
                tmp_data = stCfg->coef_max;
                ((HI_U32*)stCfg->p_coef_new)[ii] = tmp_data;
            }

        }
        else if(stCfg->coef_data_type == COEF_DATA_TYPE_S32)
        {
            for(ii=0;ii<stCfg->length;ii++)
            {
                tmp_data = stCfg->coef_max;
                ((HI_S32*)stCfg->p_coef_new)[ii] = tmp_data;
            }

        }

    }
    else
    {
        VDP_PRINT("Error, VDP_DRV_GenCoef don't support this mode!\n");
    }

    return 0;

}






