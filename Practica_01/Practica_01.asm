;------------------------------------------------------------------------------
; Práctica 1: Lenguaje Ensamblador 					      |
; Microcontrolador: PIC16F84A Frecuencia: 4MHz Voltaje:5V 		      |
; Herramienta: MPLAB v8.92 – Microchip MPASM Toolsuite 			      |
;------------------------------------------------------------------------------
;-------------- Microcontrolador a usar ---------------------------------------
		LIST	P=16F84A	; Usaremos el PIC16F84A
		RADIX	HEX		;
;-------------- Variables a usar ----------------------------------------------
STATUS		EQU	H'003'		; Declaramos la variable STATUS
PORTB		EQU	H'006'		; Declaramos la variable PORTB
TRISB		EQU	H'086'		; Declaramos la variable TRISB
RP0		EQU	H'005'		; Declaramos la variable RP0
;-------------- Vector de reset -----------------------------------------------
		ORG	H'000'		; Vector de reset del procesador
		GOTO	CONFIGURACION	; Nos manda a la etiqueta CONFIGURACION
		ORG	H'005'		; Se escribe nuestro código en 0x005
;============== Programa Principal ============================================
;-------------- Configuración del microcontrolador ----------------------------
CONFIGURACION	BSF	STATUS,RP0	; Nos movemos al Banco 1
		CLRF	TRISB		; Configura todo el puerto B como salida
		BCF	STATUS,RP0	; Nos movemos al Banco 0
;-------------- Aplicación encender LEDs --------------------------------------
LEDS		MOVLW	B'00000001'	; Guardamos un valor en el registro W
		MOVWF	PORTB		; Movemos del registro W al puerto B
;============== Fin del Programa ==============================================
		END			; Le indica al ensamblador el final
