/*
* Paulo Vasconcelos
* paulobvasconcelos@gmail.com
* 2018 march
*/

#include <detpic32.h>

#include "../helpFuncPackage/delay.h"
#include "../helpFuncPackage/charUtils.h"

int main(void) {

  // Setup
  TRISB = TRISB & 0x00FF;
  TRISDbits.TRISD5 = 0;
  TRISDbits.TRISD6 = 0;

  // Seleção de displays
  LATDbits.LATD5 = 1;
  LATDbits.LATD6 = 0;

  while(1) {

    printStr("\n> ");
    char c = toLowerCase(getChar());
    putChar(c);

    while (c != 'a' && c != 'b' && c != 'c' && c != 'd' && c != 'e' && c != 'f' && c != 'g' && c != '.') {

        printStr("\n> ");
        c = toLowerCase(getChar());
        putChar(c);

      }

    switch(c) {
      case 'a':
        LATBbits.LATB8  = 1;
        break;
      case 'b':
        LATBbits.LATB9  = 1;
        break;
      case 'c':
        LATBbits.LATB10 = 1;
        break;
      case 'd':
        LATBbits.LATB11 = 1;
        break;
      case 'e':
        LATBbits.LATB12 = 1;
        break;
      case 'f':
        LATBbits.LATB13 = 1;
        break;
      case 'g':
        LATBbits.LATB14 = 1;
        break;
      case '.':
        LATBbits.LATB15 = 1;
        break;
    }

    delay(250);

    // Reset
    LATBbits.LATB8  = 0;
    LATBbits.LATB9  = 0;
    LATBbits.LATB10 = 0;
    LATBbits.LATB11 = 0;
    LATBbits.LATB12 = 0;
    LATBbits.LATB13 = 0;
    LATBbits.LATB14 = 0;
    LATBbits.LATB15 = 0;

  }

}
