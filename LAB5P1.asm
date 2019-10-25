.MODEL small
.STACK
.DATA
	num1 DB ?
	num2 DB ?
	ingresonum1 DB 'Ingrese Primer Numero: $'
    ingresonum2 DB 'Ingrese Segundo Numero: $'
	resultado DB 'El resultado es: $'
.CODE

programa: 
	MOV AX,@DATA
	MOV DS,AX
	
	;leer numeros
	
	MOV DX, OFFSET ingresonum1
    MOV AH, 09h
    INT 21h
	
	XOR AX,AX
	MOV AH,01h
	INT 21h
	MOV num1,AL
	
	    
    MOV AH,02h      
    MOV DX, 10
    INT 21h 
	
	MOV DX, OFFSET ingresonum2
    MOV AH, 09h
    INT 21h
	
	XOR AX,AX
	MOV AH,01h
	INT 21h
	MOV num2,AL
	
	MOV AH,02h      
    MOV DX, 10
    INT 21h 
	;convertirlos al valor real
	SUB num1,30h
	SUB num2,30h
	
	;preparar valores para el ciclo
	MOV CL,num2
	
	Multiplicar:
		ADD BL,num1
		LOOP Multiplicar
		
	Imprimir:
	MOV DX, OFFSET resultado
    MOV AH, 09h
    INT 21h
	
	MOV AL, BL
	AAM
	MOV BX,AX
	MOV DL,BH
    ADD DL,30h
    MOV AH,02h
    INT 21h
	
	MOV DL,BL
    ADD DL,30h
    MOV AH,02h
    INT 21h
	
	;finalizar
	finalizar:
	MOV AH,4ch
	INT 21h
	
	
end programa
