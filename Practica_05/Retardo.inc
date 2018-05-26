;============== Retardo =======================================================
;-------------- Variables a usar ----------------------------------------------
CONTADOR1		EQU		0x0C	    ; Variable guardada en el primer GPR
CONTADOR2		EQU		0x0D	    ; Variable guardada en el segundo GPR
CONTADOR3		EQU		0x0E	    ; Variable guardada en el tercer GPR
;-------------- Subrutina RETARDO ---------------------------------------------
RETARDO_1seg	MOVLW	d'1'	    ; W se carga con el número  en decimal
				MOVWF	CONTADOR3   ; Movemos el valor de W a la variable CONT3
;-------------- Sección R_EXTERNA -------------------------------------------
R_EXTERNA		MOVLW	d'100'	    ; W se carga con el número  en decimal
				MOVWF	CONTADOR2   ; Movemos el valor de W a la varibale CONT2
;-------------- Sección R_INTERMEDIA ----------------------------------------
R_INTERMEDIA	MOVLW	d'250'	    ; W se carga con el número  en decimaL
				MOVWF	CONTADOR1   ; Movemos el valor de W a la variable CONT1
;-------------- Sección R_INTERNA -------------------------------------------
R_INTERNA		DECFSZ	CONTADOR1,1 ; Se resta 1 a X
				GOTO	R_INTERNA   ; Se decrementa X hasta que llegue a 0
				DECFSZ	CONTADOR2,1 ; Se resta 1 a Y cuando X llega a 0
				GOTO	R_INTERMEDIA; X=100 y se repite la rutina interna
				DECFSZ	CONTADOR3,1 ; Se resta 1 a Z cuando Y llegue a 0
				GOTO	R_EXTERNA   ; Se vuelven a cargar Y= y X=,
				    				; y se repite la rutina intermedia
				RETURN		    	; Salimos del RETARDO_1seg
				END		    		; Le indica al ensamblador el final