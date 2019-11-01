.MODEL small
.DATA
	ingreso 	 	DB 'Ingrese una cadena: $'
	esPalindromo 	DB 'Es Palidromo!  $'
	noEsPalindromo  DB 'No es Palidromo!  $'
	nuevaCadena 	DB '$'
	COUNT 			DB 20 DUP(0)
	
.STACK
.CODE           
programa:
	MOV AX,@DATA
	MOV DS,AX
	
	LEA DX,ingreso
	MOV AH,09h
	INT 21h
	
	MOV BX,00

CICLO:
	MOV AH,01h					;se captura el caracter
	INT 21h
	
	CMP AL,0DH
	JE SET_PALINDROMO
	
	MOV [COUNT+BX],AL
	INC BX
	LOOP CICLO
	
SET_PALINDROMO:
	MOV DI,0
	DEC BX
	JNZ PALINDROMO
	
PALINDROMO:
	MOV AL,[COUNT+BX]
	CMP AL,[COUNT+DI]
	JNE NO_PALINDROMO
	
	INC DI
	DEC BX
	JNZ PALINDROMO
	
	LEA DX,nuevaCadena
	MOV AH,09h
	INT 21h
	
	;salto de linea
	MOV AH,02h		
	MOV DX, 10
	INT 21h
	
	LEA DX,esPalindromo
	MOV AH,09h
	INT 21h
	
	JMP finalizar

NO_PALINDROMO:
	;salto de linea
	MOV AH,02h		
	MOV DX, 10
	INT 21h
	
	LEA DX,noEsPalindromo
	MOV AH,09h	
	INT 21h
	
finalizar:
	MOV AH,04ch
	INT 21h
	
END programa