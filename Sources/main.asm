;*******************************************************************
;* This stationery serves as the framework for a user application. *
;* For a more comprehensive program that demonstrates the more     *
;* advanced functionality of this processor, please see the        *
;* demonstration applications, located in the examples             *
;* subdirectory of the "Freescale CodeWarrior for HC08" program    *
;* directory.                                                      *
;*******************************************************************

; Include derivative-specific definitions
            INCLUDE 'derivative.inc'

; export symbols
            XDEF _Startup, main

; variable/data section
MY_ZEROPAGE: SECTION  SHORT         ; Insert here your data definition
t50ms EQU 31249; define
; code section
MyCode:     SECTION
main:
_Startup:
            MOV #$19,CONFIG1 ; STOP ILEGAL, +5V, SEM LVI E COP
            MOV #$0,CONFIG2 ;3.2MHZ SEM IRQ E PULLUP E SEM RESET
            MOV #$1, DDRA ; PTA 0 SAIDA
            

mainLoop:
COMECO:
            MOV #$1, PTA
            BSR DLY_1S
            MOV #$0, PTA
            BSR DLY_1S
            BRA COMECO

DLY_1S:
            LDA #20
            Loop0: LDHX #t50ms
            Loop1: AIX #-1
            CPHX #0
            BNE Loop1
            DECA
            BNE Loop0
            RTS
    