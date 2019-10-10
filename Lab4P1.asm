.MODEL small
.STACK
.DATA
	num DB ?
	espar DB 'El numero es par$'
	noespar DB 'El numero es impar$'
	residuo DB ?
.CODE
programa: 
	MOV AX,@DATA
	MOV DS,AX
	
	JMP leernumero
	finalizar:
	;finalizar
	MOV AH,4Ch
	INT 21h
	
	leernumero:
	;leer num
	XOR AX,AX
	MOV AH,01h
	INT 21h
	MOV num,AL
	SUB num,30h
		
	MOV AH,02h		
	MOV DX, 10
	INT 21h	
	
	;Dividir entre 2
	XOR AX,AX
	MOV AL,num
	MOV CL,2
	DIV CL
	;residuo en ah
	MOV residuo, AH
	
	;Comprarar
	CMP residuo,0
	JE imprimirPar
	JNE imprimirImpar

	imprimirImpar:
	MOV DX, OFFSET noespar
	MOV AH, 09h
	INT 21h
	JMP finalizar
	
	imprimirPar:
	MOV DX, OFFSET espar
	MOV AH, 09h
	INT 21h
	JMP finalizar
	
	
	
end programa
