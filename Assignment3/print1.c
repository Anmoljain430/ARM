#include "stm32f4xx.h"
void print1(const int a)
{
	 char Msg[100];
	 char *ptr;
	
		 
		 sprintf(Msg, " Y = %x ", a);
	 ptr = Msg ;
   while(*ptr != '\0')
	 {
      ITM_SendChar(*ptr);
      ++ptr;
   }
	
	 
}

