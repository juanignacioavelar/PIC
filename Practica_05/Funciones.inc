;============== Funciones =====================================================	
;-------------- Variables a usar ----------------------------------------------
TEMPORAL		EQU		0x0F			; Variable guardada en el cuarto GPR
LADO_IZQ		EQU		0x10			; Variable guardada en el quinto GPR
LADO_DER		EQU		0x11			; Variable guardada en el sexto GPR
;-------------- Subrutina Corrimiento -----------------------------------------
CORRIMIENTO		MOVLW	d'8'			; Guardamos un 8 en el registro W
				MOVWF	TEMPORAL		; Movemos el valor de W en la variable TEMPORAL
;-------------- Ascendente ------------------------------------
CORRIMIENTO_A	RLF		PORTB,1			; Movemos un 1 a la izquierda atraves del carry
				CALL	RETARDO_1seg	; Mandamos llamar la subrutina RETARDO_1Seg
				DECFSZ	TEMPORAL		; Le restamos un 1 a la variable TEMPORAL
				GOTO	CORRIMIENTO_A	; Se va a la etiqueta CORRIMIENTO_A
				MOVLW	d'8'			; Guardamos un 8 en el registro W
				MOVWF	TEMPORAL		; Movemos el valor de W en la variable TEMPORAL
;-------------- Descendente -----------------------------------
CORRIMIENTO_B	RRF		PORTB,1			; Movemos un 1 a la derecha atraves del carry
				CALL	RETARDO_1seg	; Mandamos llamar la subrutina RETARDO_1Seg
				DECFSZ	TEMPORAL		; Le restamos un 1 a la variable TEMPORAL
				GOTO	CORRIMIENTO_B	; Se va a la etiqueta CORRIMIENTO_B
				RETURN					; Regresamos a la posición del Contador del Programa
;-------------- Subrutina Vistoso ---------------------------------------------
VISTOSO			CLRF	PORTB			; Limpiamos el puerto B
;-------------- Expandir --------------------------------------
EXPANDIR		MOVLW	b'00011000'		; Guardamos 00011000 en el registro W
				MOVWF	PORTB			; Movemos el valor de W al puerto B
				CALL	RETARDO_1seg	; Mandamos llamar la subrutina RETARDO_1Seg
				MOVLW	b'00111100'		; Guardamos 00111100 en el registro W
				MOVWF	PORTB			; Movemos el valor de W al puerto B
				CALL	RETARDO_1seg	; Mandamos llamar la subrutina RETARDO_1Seg
				MOVLW	b'01111110'		; Guardamos 01111110 en el registro W
				MOVWF	PORTB			; Movemos el valor de W al puerto B
				CALL	RETARDO_1seg	; Mandamos llamar la subrutina RETARDO_1Seg
				MOVLW	b'11111111'		; Guardamos 11111111 en el registro W
				MOVWF	PORTB			; Movemos el valor de W al puerto B
				CALL	RETARDO_1seg	; Mandamos llamar la subrutina RETARDO_1Seg
;-------------- Contraer --------------------------------------
CONTRAER		MOVlW	b'01111110'		; Guardamos 01111110 en el registro W
				MOVWF	PORTB			; Movemos el valor de W al puerto B
				CALL	RETARDO_1seg	; Mandamos llamar la subrutina RETARDO_1Seg
				MOVlW	b'00111100'		; Guardamos 00111100 en el registro W
				MOVWF	PORTB			; Movemos el valor de W al puerto B
				CALL	RETARDO_1seg	; Mandamos llamar la subrutina RETARDO_1Seg
				MOVlW	b'00011000'		; Guardamos 00011000 en el registro W
				MOVWF	PORTB			; Movemos el valor de W al puerto B
				CALL	RETARDO_1seg	; Mandamos llamar la subrutina RETARDO_1Seg
				CLRF	PORTB			; Limpiamos el puerto B
				CALL	RETARDO_1seg	; Mandamos llamar la subrutina RETARDO_1Seg
				RETURN					; Regresamos a la posición del Contador de Programa
;============== Fin de Funciones ==============================================
#include <Retardo.inc>					; Librería que contiene la subrutina RETARDO
				END						; Le indica al ensamblador el final