
# include <detpic32.h>

void initAll();
void send2displays (unsigned char value, unsigned char decimalFlag);
void delay(int ms);

int main(){
    initAll();

    LATDbits.LATD4 = 1;
    LATDbits.LATD5 = 0;

    while(1){
        AD1CON1bits.ASAM = 1;
        while(IFS1bits.AD1IF == 0);

        int V = ((ADC1BUF0)*6)/1023;
        if(V==6) { V--; }

        send2displays((char)V, 0);

        switch(V){
            case 0:
                LATEbits.LATE0 = 1; LATEbits.LATE1 = 1;
                LATEbits.LATE2 = 0; LATEbits.LATE3 = 0;
                break;
            case 1:
                LATEbits.LATE0 = 0; LATEbits.LATE1 = 1;
                LATEbits.LATE2 = 0; LATEbits.LATE3 = 0;
                break;
            case 2:
                LATEbits.LATE0 = 0; LATEbits.LATE1 = 0;
                LATEbits.LATE2 = 0; LATEbits.LATE3 = 0;
                break;
            case 3:
                LATEbits.LATE0 = 0; LATEbits.LATE1 = 0;
                LATEbits.LATE2 = 1; LATEbits.LATE3 = 0;
                break;
            default:
                LATEbits.LATE0 = 0; LATEbits.LATE1 = 0;
                LATEbits.LATE2 = 1; LATEbits.LATE3 = 1;
                break;
        }
    }

    return 0;
}

void initAll(){
    TRISBbits.TRISB4 = 1;                   // disconnect digital output RB4
    AD1PCFGbits.PCFG4 = 0;                  // Configure RB4 as analog
    AD1CON1bits.SSRC = 7;                   // conversion trigger selection bits
                                            //
    AD1CON1bits.CLRASAM = 1;                // stop conversion when 1st a/d converter interrupt is generated
    AD1CON3bits.SAMC = 16;                  // sample time is 16 TAD
                                            //
    AD1CON2bits.SMPI = 0;                   // conversion will be done once (x+1)
    AD1CHSbits.CH0SA = 4;                   // Select AN4 as input for A/D
                                            //
    AD1CON1bits.ON = 1;                     //
                                            //
    IPC6bits.AD1IP = 2;                     // configuring priority of A/D interrupts
    IEC1bits.AD1IE = 1;                     // enable A/D interrups
    IFS1bits.AD1IF = 0;                     // clear A/D interrupts flag

    TRISE = TRISE & 0xFFF0;

    TRISB = TRISB & 0x00FF;

    TRISDbits.TRISD4 = 0;
    TRISDbits.TRISD5 = 0;
}

void send2displays (unsigned char value, unsigned char decimalFlag) {
  static const char display7Scodes[] = {0x3F, 0x06, 0x5B, 0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x67, 0x77, 0x7C, 0x39, 0x5E, 0x79, 0x71};
  static char displayFlag = 0;

  // Configure RB8 to RB15 as outputs
  TRISB = (TRISB & 0x00FF);

  // Configure RD5 and RD6 as outputs
  TRISDbits.TRISD5 = 0;
  TRISDbits.TRISD6 = 0;

  // Determine digits
  int digit_low = value & 0x0F;     // should be char but pcompile gives a warning and I don't like warnings :P
  int digit_high = value >> 4;      // value >> 4 & 0x000F would be the same, obviously

  // Send digit_low to display low
  if (displayFlag == 0) {
    LATB = (LATB & 0x00FF) | (display7Scodes[digit_low] << 8);
    LATDbits.LATD5 = 1;
    LATDbits.LATD6 = 0;
  }

  // Send digit_high to display high
  else {
    LATB = (LATB & 0x00FF) | (display7Scodes[digit_high] << 8);
    LATDbits.LATD5 = 0;
    LATDbits.LATD6 = 1;

    if (decimalFlag == 1) {  // Decimal point
      LATBbits.LATB15 = 1;
    }
  }

  // Toggle displayFlag
  displayFlag = !displayFlag;
}

void delay(int ms) {
	for(; ms>0; ms--) {
		resetCoreTimer();
		while(readCoreTimer() < 20000);
	}
}
