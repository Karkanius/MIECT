/*
* Paulo Vasconcelos
* paulobvasconcelos@gmail.com
* 2018 march
*/

# include <detpic32.h>

void delay(int ms) {
	while(ms > 0)
	{
		resetCoreTimer();
    while(readCoreTimer() < PBCLK/1000) { ms--; }
  }
}
