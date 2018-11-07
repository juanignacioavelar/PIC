;-------------- Microcontrolador a usar ---------------------------------------
		LIST	P=16F84A	; Usaremos el PIC16F84A
		RADIX	HEX		; Valores hexadecimales
;-------------- Variables a usar ----------------------------------------------
STATUS		EQU	0x03		; Declaramos la variable STATUS
PORTB		EQU	0x06		; Declaramos la variable PORTB
TRISB		EQU	0x86		; Declaramos la variable TRISB
RP0		EQU	0x05		; Declaramos la variable RP0
;-------------- Vector de reset -----------------------------------------------
		ORG	0x000		; Vector de reset del procesador
		GOTO	CONFIGURACION	; Nos manda a la etiqueta CONFIGURACION
		ORG	0x005
;============== Programa Principal ============================================
;-------------- Configuración del microcontrolador ----------------------------
CONFIGURACION	BSF	STATUS,RP0	; Nos movemos al Banco 1
		CLRF	TRISB		; Configura todo el puerto B como salida
		BCF	STATUS,RP0	; Nos movemos al Banco 0
;-------------- Aplicación encender LEDs --------------------------------------
LEDS		MOVLW	b'00000001'	; Guardamos un valor en el registro W
		MOVWF	PORTB		; Movemos del registro W al puerto B
		SLEEP			; Manda a dormir el CPU
;============== Fin del Programa ==============================================
		END			; Le indica al ensamblador el final
