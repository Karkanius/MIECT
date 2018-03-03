#
# Paulo Vasconcelos
# paulobvasconcelos@gmail.com
# 2018 march
#

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

main:   lui $t1, SFR_BASE_HI
        jr $ra
