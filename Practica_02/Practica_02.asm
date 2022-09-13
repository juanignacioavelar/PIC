;-----------------------------------------------------------------------------;
; Práctica 2: Entradas y salidas digitales				      |
; Microcontrolador: PIC16F84A Frecuencia: 4MHz Voltaje:5V		      |
; Herramienta: MPLAB v8.92 – Microchip MPASM Toolsuite			      |
;-----------------------------------------------------------------------------;
;-------------- Archivos de inclusión (Librerías) -----------------------------
#include "p16f84a.inc"			; Librería del PIC16F84A
;-------------- Bits de Configuración -----------------------------------------
 __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_OFF & _CP_OFF
;-------------- Vector de reset -----------------------------------------------
		ORG	0x000		; Vector de reset del procesador
		GOTO	CONFIGURACION 	; Nos manda a la etiqueta CONFIGURACION
		ORG	0x005
;============== Programa Principal ============================================
;-------------- Configuración del microcontrolador ----------------------------
CONFIGURACION	CLRF    PORTA		; Limpia el registro PORTA
		CLRF    PORTB		; Limpia el registro PORTB
		BSF	STATUS,RP0	; Nos movemos al Banco 1
		BSF	TRISA,RA0	; Configuramos el pin RA0 como entrada	
		BCF	TRISB,RB0	; Configuramos el pin RB0 como salida
		BCF	STATUS,RP0	; Regresamos al Banco 0
;-------------- Aplicación encender LEDs --------------------------------------
LED		BTFSC	PORTA,RA0	; Si es cero se brinca a la siguiente instr
		GOTO	LED_ON		; Nos manda a la etiqueta LED_ON
		GOTO	LED_OFF		; Nos manda a la etiqueta LED_OFF
;-------------- Subrutina LED_ON ----------------------------------------------
LED_ON		BSF	PORTB,RB0	; Enciende el LED en RB0
		GOTO	LED		; Nos manda a la etiqueta LED
;-------------- Subrutina LED_OFF ---------------------------------------------
LED_OFF		BCF	PORTB,RB0	; Apaga el LED en RB0
		GOTO	LED		; Nos manda a la etiqueta LED
;============== Fin del Programa ==============================================
		END			; Le indica al ensamblador el final
