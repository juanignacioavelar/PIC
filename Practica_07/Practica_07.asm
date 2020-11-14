; Asignatura: Microcontroladores
; Sección: X
; Unidad: 2 - Lenguaje Ensamblador
; Alumno: Juan Ignacio Avelar Miranda
; Código: 
; Práctica No.7 - Contador con Display 7 SEG
#INCLUDE "p16f84a.inc"
#INCLUDE "Banco.inc"
;----------------------------------------------
				ORG		H'000'		  
				GOTO	CONFIGURACION 
				ORG		H'005'		  
;----------------------------------------------
CONFIGURACION	BANCO_1	  			  	  	
				CLRF	TRISB
				BANCO_0	  			  
				CLRF    PORTB
;----------------------------------------------
CONTADOR		CALL	CERO
				CALL	RETARDO_1seg
				CALL	UNO
				CALL	RETARDO_1seg
				CALL	DOS
				CALL	RETARDO_1seg
				CALL	TRES
				CALL	RETARDO_1seg
				CALL	CUATRO
				CALL	RETARDO_1seg
				CALL	CINCO
				CALL	RETARDO_1seg
				CALL	SEIS
				CALL	RETARDO_1seg
				CALL	SIETE
				CALL	RETARDO_1seg
				CALL	OCHO
				CALL	RETARDO_1seg
				CALL	NUEVE
				CALL	RETARDO_1seg
				GOTO	CONTADOR
;----------------------------------------------
#INCLUDE "Retardo.inc"
#INCLUDE "Numeros.inc"
				END
