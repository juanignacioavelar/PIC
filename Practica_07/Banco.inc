;-------------- Macros para Bancos de memoria -------------------
;-------------- Banco 0 -----------------------------------------
BANCO_0	MACRO
		BCF		STATUS,RP0
		ENDM
;-------------- Banco 1 -----------------------------------------
BANCO_1	MACRO
		BSF		STATUS,RP0
		ENDM