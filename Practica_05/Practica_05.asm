;-----------------------------------------------------------------------------;
; Práctica 5: Creación de librerías ;
; Microcontrolador: PIC16F84A Frecuencia: 4MHz Voltaje:5V ;
; Herramienta: MPLAB v8.92 – Microchip MPASM Toolsuite ;
;-----------------------------------------------------------------------------;
;-------------- Archivos de inclución (Librerias) -----------------------------
#include "p16f84a.inc"
;-------------- Bits de Configuración -----------------------------------------
; __config 0x3FF9
__CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_OFF & _CP_OFF
;-------------- Variables a usar ----------------------------------------------
TEMPORAL	ORG	H'00C'		; Variable guardada en GPR0.
CONTADOR1	ORG	H'00D'		; Variable guardada en GPR1.
CONTADOR2	ORG	H'00E'		; Variable guardada en GPR2.
CONTADOR3	ORG	H'00F'		; Variable guardada en GPR3.
;-------------- Vector de reset -----------------------------------------------
		ORG    	H'000'	    	; Vector de reset del procesador
		GOTO   	CONFIGURACION	; Nos manda a la etiqueta CONFIGURACION
		ORG	H'005'
;============== Programa Principal ============================================
;-------------- Configuración del microcontrolador ----------------------------
CONFIGURACION	BSF	STATUS,RP0  	; Nos movemos al Banco 1
		BSF	TRISA,RA0	; Configuramos RA0 como Entrada
		BSF	TRISA,RA1	; Configuramos RA1 como Entrada
		CLRF	TRISB	    	; Configuramos el puerto B como Salida
		BCF	STATUS,RP0  	; Regresamos al Banco 0
		CLRF	PORTA		; Limpia el registro PORTA
		CLRF    PORTB	    	; Limpia el registro PORTB
;-------------- Loop Infinito -------------------------------------------------
PRINCIPAL	BTFSC	PORTA,RA0	; Si RA0=0 brinca 2 instrucciones
		GOTO	BOTON_0		; si no, se mueve a BOTON_RA0.
		BTFSC	PORTA,RA1	; Si RA1=0 brinca 2 instrucciones
		GOTO	BOTON_1		; si no, se mueve a BOTON_RA1.
		GOTO	PRINCIPAL	; Se mueve a PRINCIPAL.
;-------------- Aplicación ----------------------------------------------------
BOTON_0		CALL	CORRIMIENTO 	; Manda a llamar CORRIMIENTO.
		GOTO	PRINCIPAL   	; Se mueve a PRINCIPAL.
BOTON_1		CALL	VISTOSO	    	; Manda a llamar VISTOSO.
		GOTO	PRINCIPAL   	; Se hace un loop infinito
;============== Fin del Programa ==============================================
#include <Funciones.inc>		; Librería subrutina FUNCIONES.
#INCLUDE <Retardo.inc>			; Librería subrutina RETARDO.
		END		    	; Le indica al ensamblador el final
