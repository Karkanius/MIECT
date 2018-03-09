/*
* Paulo Vasconcelos
* paulobvasconcelos@gmail.com
* 2018 march
*/

#include <detpic32.h>

#include "../helpFuncPackage/delay.h"

int main(void) {

  LATDbits.LATD0 = 0;                   // The initial value should be set
                                        // before configuring the port as output
  TRISDbits.TRISD0 = 0;                 // RD0 configured as output

  while(1) {
    delay(500);                         // Half period = 0.5s
    LATDbits.LATD0 = !LATDbits.LATD0;
  }

  return -1;
}
