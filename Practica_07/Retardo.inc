;-------------- Variables a usar ----------------------------------------------
CONTADOR1		EQU		0x0C	    ; Variable guardada en el primer GPR
CONTADOR2		EQU		0x0D	    ; Variable guardada en el segundo GPR
CONTADOR3		EQU		0x0E	    ; Variable guardada en el tercer GPR
;-------------- Subrutina Retardo ----------------------------
RETARDO_1seg	MOVLW	D'10'
				MOVWF	CONTADOR3
R_EXTERNA		MOVLW	D'100'
				MOVWF	CONTADOR2
R_INTERMEDIA	MOVLW	D'250'
				MOVWF	CONTADOR1
R_INTERNA		DECFSZ	CONTADOR1,1
				GOTO	R_INTERNA
				DECFSZ	CONTADOR2,1
				GOTO	R_INTERMEDIA
				DECFSZ	CONTADOR3,1
				GOTO	R_EXTERNA
				RETURN
;-------------- Fin de Subrutina ----------------------------