;-------------- Archivos de inclución (Librerias) -----------------------------
#include "p16f84a.inc"
;-------------- Bits de Configuración -----------------------------------------
; __config 0x3FF9
__CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_OFF & _CP_OFF
;-------------- Vector de reset -----------------------------------------------
				ORG    	0x000	    	; Vector de reset del procesador
				GOTO   	CONFIGURACION	; Nos manda a la etiqueta CONFIGURACION
				ORG		0x005
;============== Programa Principal ============================================
;-------------- Configuración del microcontrolador ----------------------------
CONFIGURACION	CLRF	PORTA			; Limpia el registro PORTA
				CLRF    PORTB	    	; Limpia el registro PORTB
				BSF		STATUS,RP0  	; Nos movemos al Banco 1
				BSF		TRISA,RA0		; Configuramos RA0 como Entrada
				BSF		TRISA,RA1		; Configuramos RA1 como Entrada
				CLRF	TRISB	    	; Configuramos el puerto B como Salida
				BCF		STATUS,RP0  	; Regresamos al Banco 0
;-------------- Loop Infinito -------------------------------------------------
PRINCIPAL		BTFSC	PORTA,RA0		; Si 
				GOTO	BOTON_0			; 
				BTFSC	PORTA,RA1		; 
				GOTO	BOTON_1			; 
				GOTO	PRINCIPAL		; 
;-------------- Aplicación ----------------------------------------------------
BOTON_0			CALL	CORRIMIENTO 	; 
				GOTO	PRINCIPAL   	; 
BOTON_1			CALL	VISTOSO	    	; 
				GOTO	PRINCIPAL   	; Se hace un loop infinito
;============== Fin del Programa ==============================================
#include <Funciones.inc>
				END		    			; Le indica al ensamblador el final