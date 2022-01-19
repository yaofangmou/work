#include <stdio.h>
#include "fv_dbg.h"
#include "fv_config.h"
#include "hi_adp_ini.h"

int fv_get_configs(const char* ini_file, struct fv_config_item *config)
{
    config->tuner.freq                = HIADP_INI_Getl(FV_TUNER_SECTION, FREQ_KEY, 0, ini_file);
    config->tuner.symbol_rate_or_band = HIADP_INI_Getl(FV_TUNER_SECTION, SYMBOL_RATE_BAND_KEY, 0, ini_file);
    config->tuner.mode_type_or_polar  = HIADP_INI_Getl(FV_TUNER_SECTION, MODE_TYPE_POLAR_KEY, 0, ini_file);
    config->tuner.reverse             = HIADP_INI_Getl(FV_TUNER_SECTION, REVERSE_KEY, 0, ini_file);
    return 0;
}
