/*
* Paulo Vasconcelos
* paulobvasconcelos@gmail.com
* 2018 march
*/

#include <detpic32.h>

#include "../helpFuncPackage/delay.h"

int main(void) {
	LATE = LATE & 0xFFF0;
	TRISE = TRISE & 0xFFF0;

	int counter = 0;

	while(1) {
		delay(250);
		counter++;
		counter = counter & 0x000F;
		LATE = (LATE & 0xFFF0) | counter;
	}

	return -1;
}
