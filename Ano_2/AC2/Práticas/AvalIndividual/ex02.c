// ---------------------------
// Paulo Vasconcelos
// 2018 may
// paulobvasconcelos@gmail.com
// ---------------------------

# include <detpic32.h>

int main(void) {

  // Read char from keyboard
  char c = 't';
  //scanf("%c\n", c);

  // Aulixiar bit (RD3) setup
  TRISDbits.TRISD3 = 0;   // Configured as output
  LATDbits.LATD3 = 1;     // Data will be trasmited while LATD3=0;

  // I2C initialization
  int clock_freq = 9600;
  I2C1BRG = PBCLK + clock_freq / (2 * clock_freq) - 1;  // Baudrate
  I2C1CONbits.ON = 1;                                   // Enable I2C1 module

  // Cycle
  while(1) {
    // LATD3 to 0 to signal start of data transmition
    LATDbits.LATD3 = 0;

    /*
     * START TRANSMITION
     */
    while ((I2C1CON & 0x1F) != 0);
    I2C1CONbits.SEN = 1;
    while (I2C1CONbits.SEN != 0);

    // Send char c
    I2C1TRN = c;
    while (I2C1STATbits.TRSTAT == 1);

    /*
     * STOP TRANSMITION
     */
    while ((I2C1CON & 0x1F) != 0);
    I2C1CONbits.PEN = 1;
    while (I2C1CONbits.PEN != 0);

    // LATD3 to 1 to signal end of data transmition
    LATDbits.LATD3 = 1;
  }

  return 0;
}
