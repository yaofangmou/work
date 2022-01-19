#ifndef __TIMER_H__
#define __TIMER_H__


/* function */
extern void TIMER_Enable(HI_U8 index);
extern void TIMER_Disable(HI_U8 index);
extern void TIMER_Init(void);
extern void TIMER_Isr(void);

#endif