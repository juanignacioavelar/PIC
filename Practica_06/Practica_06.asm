;-------------- Archivos de inclusión (Librerías) -----------------------------
#include "p16f84.inc"				; Librería del PIC16F84
;-------------- Bits de Configuración -----------------------------------------
 __CONFIG _XT_OSC & _WDT_OFF & _PWRTE_ON & _CP_OFF
;-------------- Vector de reset -----------------------------------------------  
		ORG	0x000			; Vector de reset del procesador
		GOTO	CONFIGURACION		; Nos manda a la etiqueta CONFIGURACION
		ORG	0x005
;============== Programa Principal ============================================
;-------------- Configuración del microcontrolador ----------------------------
CONFIGURACION	CLRF    PORTA			; Limpia el registro PORTA
		CLRF    PORTB			; Limpia el registro PORTB
		BSF	STATUS,RP0		; Nos movemos al Banco 1
		BSF     TRISA,RA0		; Configuramos el pin RA0 como entrada
		BSF     TRISA,RA2		; Configuramos el pin RA2 como entrada
		BCF	TRISB,RB0		; Configuramos el pin RB0 como salida
		BCF	STATUS,RP0		; Regresamos al Banco 0
;-------------- Aplicación control de NIVEL -----------------------------------
COMP1		BTFSS	PORTA,RA0		; Compara si RA0=1 y brinca a comparar RA2
		GOTO	COMP2			; si no, brinca a la etiqueta COMP2
		BTFSS	PORTA,RA2		; Compara si RA2=1 y brinca a apagar la bomba
		GOTO	COMP2			; si no, brinca a la etiqueta COMP2
		GOTO	APAGAR			; Brinca a la subrutina APAGAR
COMP2		BTFSC	PORTA,RA0		; Compara si RA0=0 y brinca a comparar RA2
		GOTO	COMP1			; si no, brinca a la etiqueta COMP1
		BTFSC	PORTA,RA2		; Compara si RA2=0 y brinca a encender la bomba
		GOTO	COMP1			; si no, brinca a la etiqueta COMP1
		GOTO	ENCENDER		; Brinca a la subrutina ENCENDER
;-------------- Subrutina prender bomba de agua -------------------------------
ENCENDER	BSF	PORTB,RB0		; Manda un 1 en RB0 para encender el led
		GOTO	COMP2			; Brinca a la etiqueta COMP2
;-------------- Subrutina prender bomba de agua -------------------------------
APAGAR		BCF	PORTB,RB0		; Manda un 0 en RB0 para apagar el led
		GOTO	COMP1			; Brinca a la etiqueta COMP1
;============== Fin del Programa ==============================================
		END				; Le indica al ensamblador el final
