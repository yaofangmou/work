#ifndef __DEBUG_ASSISTANT_LANG_H__
#define __DEBUG_ASSISTANT_LANG_H__

#include "hi_type.h"

#define LANG (2)
#define LEN (128)

HI_CHAR OPEN_LOG_FAIL[LANG][LEN] = {"Open log file for debug assistant fail.\r\n","调试助手打开目志文件失败。"};
HI_CHAR OPEN_LOG_FAIL_CHECK[LANG][LEN] = {"Please check:\r\n","请确认:\r\n"};
HI_CHAR OPEN_LOG_FAIL_PROMPT1[LANG][LEN] = {"\t1.Whether the device is writable; \r\n","\t1.设备是否允许写入；\r\n"};
HI_CHAR OPEN_LOG_FAIL_PROMPT2[LANG][LEN] = {"\t2.Whether the device is full.\n","\t2.设备是否已满。\r\n"};

HI_CHAR WELCOME_SYMBOL[LANG][LEN] = {"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\r\n","~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\r\n"};
HI_CHAR WELCOME_SYMBOL2[LANG][LEN] = {"~                                  ~\r\n","~                                  ~\r\n"};
HI_CHAR WELCOME_PROMPT[LANG][LEN] = {"~  WELCOME TO USE DEBUG_ASSISTANT  ~\r\n","~       欢迎使用问题定位助手       ~\r\n"};

HI_CHAR WARNING[LANG][LEN] = {"[!!WARNING]","[!!WARNING]"};
HI_CHAR ERROE[LANG][LEN] =   {"[!!!!ERROR]","[!!!!ERROR]"};

HI_CHAR CATALOG_ROOT[LANG][LEN] = {"====================\r\n=       Root       =\r\n====================\r\n",
                                   "====================\r\n=       Root       =\r\n====================\r\n"};
HI_CHAR CATALOG_1[LANG][LEN] = {"====================\r\n=  PLAYBACK ISSUE  =\r\n====================\r\n",
                                "====================\r\n=  PLAYBACK ISSUE  =\r\n====================\r\n"};
HI_CHAR CATALOG_2[LANG][LEN] = {"====================\r\n=    HDMI ISSUE    =\r\n====================\r\n",
                                "====================\r\n=    HDMI ISSUE    =\r\n====================\r\n"};
HI_CHAR CATALOG_3[LANG][LEN] = {"====================\r\n=     USB ISSUE    =\r\n====================\r\n",
                                "====================\r\n=     USB ISSUE    =\r\n====================\r\n"};
HI_CHAR CATALOG_4[LANG][LEN] = {"====================\r\n=   OTHER ISSUE    =\r\n====================\r\n",
                                "====================\r\n=   OTHER ISSUE    =\r\n====================\r\n"};

HI_CHAR CASE_SELECT_PROMPT[LANG][LEN] = {"What is the problem?\r\n","What is the problem?\r\n"};
HI_CHAR CASE_SELECT_INPUT[LANG][LEN] = {"Please input your choice:\r\n","Please input your choice:\r\n"};
HI_CHAR CASE_SELECT_BACK[LANG][LEN] = {"0: Go back to last level\r\n","0: Go back to last level\r\n"};
HI_CHAR CASE_SELECT_QUIT[LANG][LEN] = {"q: Quit\r\n","q: Quit\r\n"};

HI_CHAR CASE_SELECT_1[LANG][LEN] = {"1: Playback issue\r\n","1: Playback issue\r\n"};
HI_CHAR CASE_SELECT_2[LANG][LEN] = {"2: HDMI issue\r\n","2: HDMI issue\r\n"};
HI_CHAR CASE_SELECT_3[LANG][LEN] = {"3: USB issue\r\n","3: USB issue\r\n"};
HI_CHAR CASE_SELECT_4[LANG][LEN] = {"4: Other issue\r\n","4: Other issue\r\n"};

HI_CHAR CASE_SELECT_1_1[LANG][LEN] = {"1: The broadcast does not work\r\n","1: The broadcast does not work\r\n"};
HI_CHAR CASE_SELECT_1_2[LANG][LEN] = {"2: The playback is not smooth\r\n","2: The playback is not smooth\r\n"};
HI_CHAR CASE_SELECT_1_3[LANG][LEN] = {"3: The video and audio out of sync\r\n","3: The video and audio out of sync\r\n"};
HI_CHAR CASE_SELECT_1_4[LANG][LEN] = {"4: Other playback issue\r\n","4: Other playback issue\r\n"};

HI_CHAR CASE_SELECT_2_1[LANG][LEN] = {"1: No signal \r\n","1: No signal \r\n"};
HI_CHAR CASE_SELECT_2_2[LANG][LEN] = {"2: Display abnormal \r\n","2: Display abnormal \r\n"};
HI_CHAR CASE_SELECT_2_3[LANG][LEN] = {"3: Picture jitter or display noise \r\n","3: Picture jitter or display noise \r\n"};
HI_CHAR CASE_SELECT_2_4[LANG][LEN] = {"4: No sound \r\n","4: No sound \r\n"};
HI_CHAR CASE_SELECT_2_5[LANG][LEN] = {"5: Noise sound \r\n","5: Noise sound \r\n"};

HI_CHAR CASE_SELECT_3_1[LANG][LEN] = {"1: USB device does not work\r\n","1: USB device does not work\r\n"};

HI_CHAR RESPONSE_INPUT[LANG][LEN] = {"Input","Input"};
HI_CHAR RESPONSE_BACK[LANG][LEN] = {"Will go back\r\n","Will go back\r\n"};
HI_CHAR RESPONSE_QUIT[LANG][LEN] = {"Will quit\r\n","Will quit\r\n"};
HI_CHAR RESPONSE_DONE[LANG][LEN] = {"Debug done, will quit\r\n","Debug done, will quit\r\n"};
HI_CHAR RESPONSE_INVALID_INPUT[LANG][LEN] = {"Invalid input...\r\n","Invalid input...\r\n"};

HI_CHAR WRITE_PROC[LANG][LEN] = {"Write proc: ","Write proc: "};
HI_CHAR READ_PROC[LANG][LEN] = {"Read proc: ","Read proc: "};
HI_CHAR READ_RESULT[LANG][LEN] = {"Read","Read"};

HI_CHAR TUNER[LANG][LEN] = {"Tuner","Tuner"};
HI_CHAR TUNER_LOCK[LANG][LEN] = {"is locked","is locked"};
HI_CHAR TUNER_UNLOCK[LANG][LEN] = {"is unlocked, please check","is unlocked, please check"};

HI_CHAR CAT_ALL_PROC[LANG][LEN] = {"Will read all of the proc 3 times:\r\n","Will read all of the proc 3 times:\r\n"};

HI_CHAR PROMPT_CHECK_OK_OR_NOT[LANG][LEN] = {"Is it smooth now? Please input y or n:","Whether it is smooth now? Please input y or n:"};

HI_CHAR ERR_NEED_PLAY_FIRST[LANG][LEN] = {"Error: Please play media firstly.\r\n","Error: Please play media firstly.\r\n"};


#endif /* __DEBUG_ASSISTANT_LANG_H__ */

