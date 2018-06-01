# include <detpic32.h>

# define DisableUart1RxInterrupt() IEC0bits.U1RXIE = 0
# define EnableUart1RxInterrupt()  IEC0bits.U1RXIE = 1
# define DisableUart1TxInterrupt() IEC0bits.U1TXIE = 0
# define EnableUart1TxInterrupt()  IEC0bits.U1TXIE = 1


void configUART(unsigned int baudrate, unsigned char parity, unsigned int databits, unsigned int stopbits) {

	// config baudrate
	if (baudrate < 600 || baudrate > 115200) baudrate = 115200;
	U1BRG = ((PBCLK + 8 * baudrate) / (16 * baudrate)) - 1;
	U1MODEbits.BRGH = 0;

	// config parity
	if(databits == 9) {
		U1MODEbits.PDSEL = 11;
		// 11 = 9-bit data, no parity
	}
	else {
		if (parity == 'E')
			U1MODEbits.PDSEL = 01; 	// 01 = 8-bit data, even parity
		else if (parity == 'O')
			U1MODEbits.PDSEL = 10; 	// 10 = 8-bit data, odd parity
		else
			U1MODEbits.PDSEL = 00; 	// 00 = 8-bit data, no parity
	}

	// config stop bits
	if (stopbits == 2)
		U1MODEbits.STSEL = 1; 	// 1 = 2 stop bits
	else
		U1MODEbits.STSEL = 0;		// 0 = 1 stop bit

	// enablements!
	U1STAbits.UTXEN = 1; 	// enable transmission
	U1STAbits.URXEN = 1; 	// enable reception
	U1MODEbits.ON = 1; 		// enable UART1
}
