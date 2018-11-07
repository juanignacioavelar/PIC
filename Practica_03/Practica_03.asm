;-------------- Archivos de inclusión (Librerías) -----------------------------
#include "p16f84.inc"		    	; Librería del PIC16F84
;-------------- Bits de Configuración -----------------------------------------
 __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_OFF & _CP_OFF
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
;-------------- Subrutina RETARDO_10us ----------------------------------------
RETARDO_10us	NOP			; Instrucción que no hace nada,
		NOP			; no afecta ninguna bandera,
		NOP		        ; solo sirve para quemar una instrucción
		NOP			; la cual consume un ciclo de reloj.
		NOP			; En éste ejemplo la utilizamos para generar
		NOP			; una subrutina de retardo, como usamos un
		RETURN			; cristal de 4MHz y configuramos el CPU a
					; trabajar a dicha frecuencia, el calculo da
					; 4x(1/Fosc)= 4/4MHz = 1us por instrucción
					; Todo esto generó un retardo de 10us
;-------------- Subrutina RETARDO_100us ---------------------------------------
RETARDO_100us	CALL	RETARDO_10us	; Subrutina que genera un retardo de 100us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		RETURN
;-------------- Subrutina RETARDO_1ms -----------------------------------------
RETARDO_1ms	CALL	RETARDO_100us	; Subrutina que genera un retardo de 1ms
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		RETURN
;-------------- Subrutina RETARDO_10ms ----------------------------------------
RETARDO_10ms	CALL	RETARDO_1ms	; Subrutina que genera un retardo de 10ms
		CALL	RETARDO_1ms
		CALL	RETARDO_1ms
		CALL	RETARDO_1ms
		CALL	RETARDO_1ms
		CALL	RETARDO_1ms
		CALL	RETARDO_1ms
		CALL	RETARDO_1ms
		CALL	RETARDO_1ms
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		RETURN
;-------------- Subrutina RETARDO_100ms ---------------------------------------
RETARDO_100ms	CALL	RETARDO_10ms	; Subrutina que genera un retardo de 100ms
		CALL	RETARDO_10ms
		CALL	RETARDO_10ms
		CALL	RETARDO_10ms
		CALL	RETARDO_10ms
		CALL	RETARDO_10ms
		CALL	RETARDO_10ms
		CALL	RETARDO_10ms
		CALL	RETARDO_10ms
		CALL	RETARDO_1ms
		CALL	RETARDO_1ms
		CALL	RETARDO_1ms
		CALL	RETARDO_1ms
		CALL	RETARDO_1ms
		CALL	RETARDO_1ms
		CALL	RETARDO_1ms
		CALL	RETARDO_1ms
		CALL	RETARDO_1ms
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		RETURN
;-------------- Subrutina RETARDO_1seg ----------------------------------------
RETARDO_1seg	CALL	RETARDO_100ms	; Subrutina que genera un retardo de 1seg
		CALL	RETARDO_100ms
		CALL	RETARDO_100ms
		CALL	RETARDO_100ms
		CALL	RETARDO_100ms
		CALL	RETARDO_100ms
		CALL	RETARDO_100ms
		CALL	RETARDO_100ms
		CALL	RETARDO_100ms
		CALL	RETARDO_10ms
		CALL	RETARDO_10ms
		CALL	RETARDO_10ms
		CALL	RETARDO_10ms
		CALL	RETARDO_10ms
		CALL	RETARDO_10ms
		CALL	RETARDO_10ms
		CALL	RETARDO_10ms
		CALL	RETARDO_10ms
		CALL	RETARDO_1ms
		CALL	RETARDO_1ms
		CALL	RETARDO_1ms
		CALL	RETARDO_1ms
		CALL	RETARDO_1ms
		CALL	RETARDO_1ms
		CALL	RETARDO_1ms
		CALL	RETARDO_1ms
		CALL	RETARDO_1ms
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_100us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		CALL	RETARDO_10us
		NOP
		NOP
		NOP
		NOP
		NOP
		NOP
		RETURN
;============== Fin del Programa ==============================================
		END			; Le indica al ensamblador el final
