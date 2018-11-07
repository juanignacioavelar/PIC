;-------------- Archivos de inclución (Librerias) -----------------------------
#include "p16f84.inc"		    	; Libreria del PIC16F84
;-------------- Bits de Configuración -----------------------------------------
__CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_OFF & _CP_OFF
;-------------- Variables a usar ----------------------------------------------
CONTADOR1	EQU	0x0C	        ; Variable guardada en el primer GPR
CONTADOR2	EQU	0x0D		; Variable guardada en el segundo GPR
CONTADOR3	EQU	0x0E		; Variable guardada en el tercer GPR
;-------------- Vector de reset -----------------------------------------------
    		ORG	0x000		; Vector de reset del procesador
		GOTO    CONFIGURACION	; Nos manda a la etiqueta CONFIGURACION
		ORG	0x005
;============== Programa Principal ============================================
;-------------- Configuración del microcontrolador ----------------------------
CONFIGURACION	CLRF    PORTB		; Limpia el registro PORTB
		BSF	STATUS,RP0	; Nos movemos al Banco 1
		BCF	TRISB,RB0	; Configuramos el pin RB0 como Salida
		BCF	STATUS,RP0	; Regresamos al Banco 0
;-------------- Loop Infinito -------------------------------------------------
PRINCIPAL	BSF	PORTB,RB0	; Manda un 1 en RB0 para encender el led
		CALL	RETARDO_1seg	; Saltamos hacia la subrutina RETARDO
		BCF	PORTB,RB0	; Manda un 0 en RB0 para apagar el led
		CALL	RETARDO_1seg	; Saltamos hacia la subrutina RETARDO
		GOTO	PRINCIPAL	; Se hace un loop infinito
;-------------- Subrutina RETARDO ---------------------------------------------
RETARDO_1seg	MOVLW	d'10'		; W se carga con el número  en decimal
		MOVWF	CONTADOR3	; movemos el valor de W a la variable CONTADOR3
;-------------- Sección R_EXTERNA -------------------------------------------
R_EXTERNA	MOVLW	d'100'		; W se carga con el número  en decimal
		MOVWF	CONTADOR2	; movemos el valor de W a la varibale CONTADOR2
;-------------- Sección R_INTERMEDIA ----------------------------------------
R_INTERMEDIA	MOVLW	d'250'		; W se carga con el número  en decimaL
		MOVWF	CONTADOR1	; movemos el valor de W a la variable CONTADOR1
;-------------- Sección R_INTERNA -------------------------------------------
R_INTERNA	DECFSZ	CONTADOR1,1	; Se resta 1 a CONTADOR1
		GOTO	R_INTERNA	; Se decrementa CONTADOR1 hasta que llegue a 0
		DECFSZ	CONTADOR2,1	; Se resta 1 a CONTADOR2 cuando CONTADOR1 llega a 0
		GOTO	R_INTERMEDIA	; CONTADOR1=100 y se repite la rutina interna
		DECFSZ	CONTADOR3,1	; Se resta 1 a CONTADOR3 cuando CONTADOR2 llegue a 0
		GOTO	R_EXTERNA	; Se vuelven a cargar CONTADOR2=97 y CONTADOR1=100,
					; se repite la rutina intermedia
		RETURN			; Salimos del RETARDO_1seg
;============== Fin del Programa ==============================================
		END			; Le indica al ensamblador el final
