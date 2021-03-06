#
# Paulo Vasconcelos
# paulobvasconcelos@gmail.com
# 2018 march
#

        .equ SFR_BASE_HI, 0xBF88 # 16 MSbits of SFR area

        .equ TRISA, 0x6000 	# TRISA address is 0xBF886000
        .equ PORTA, 0x6010	# PORTA address is 0xBF886010
        .equ LATA,  0x6020 	# LATA  address is 0xBF886020
        .equ ODCA,  0x6030 	# ODCA  address is 0xBF886030

        .equ TRISB, 0x6040 	# TRISB address is 0xBF886040
        .equ PORTB, 0x6050	# PORTB address is 0xBF886050
        .equ LATB,  0x6060 	# LATB  address is 0xBF886060
        .equ ODCB,  0x6070 	# ODCB  address is 0xBF886070

        .equ TRISC, 0x6080 	# TRISC address is 0xBF886080
        .equ PORTC, 0x6090	# PORTC address is 0xBF886090
        .equ LATC,  0x60A0 	# LATEC address is 0xBF8860A0
        .equ ODCC,  0x60B0 	# ODCC  address is 0xBF8860B0

        .equ TRISD, 0x60C0 	# TRISD address is 0xBF8860C0
        .equ PORTD, 0x60D0	# PORTD address is 0xBF8860D0
        .equ LATD,  0x60E0 	# LATD  address is 0xBF8860E0
        .equ ODCD,  0x60F0 	# ODCD  address is 0xBF8860F0

        .equ TRISE, 0x6100 	# TRISE address is 0xBF886100
        .equ PORTE, 0x6110	# PORTE address is 0xBF886110
        .equ LATE,  0x6120 	# LATE  address is 0xBF886120
        .equ ODCE,  0x6130 	# ODCE  address is 0xBF886130

        .equ TRISF, 0x6140 	# TRISF address is 0xBF886140
        .equ PORTF, 0x6150	# PORTF address is 0xBF886150
        .equ LATF,  0x6160 	# LATF  address is 0xBF886160
        .equ ODCF,  0x6170 	# ODCF  address is 0xBF886170

        .equ TRISG, 0x6180 	# TRISG address is 0xBF886180
        .equ PORTG, 0x6190	# PORTG address is 0xBF886190
        .equ LATG,  0x1A0  	# LATG  address is 0xBF8861A0
        .equ ODCG,  0x61B0 	# ODCG  address is 0xBF8861B0

        .equ inkey,           1
        .equ getChar,         2
		    .equ putChar,         3
        .equ readInt,         4
        .equ readInt10,       5
		    .equ printInt,        6
        .equ printInt10,      7
        .equ printStr,        8
		    .equ readStr,         9
        .equ exit,            10
        .equ readCoreTimer,   11
        .equ resetCoreTimer,  12

		    .data

		    .text
		    .globl main

main:   lui $t1, SFR_BASE_HI 			#
    		jr $ra
