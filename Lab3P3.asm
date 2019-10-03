.MODEL small            
.DATA
        num1 DB ?
        num2 DB ?
		numero1 DB 'Ingrese Primer Numero: $'
		numero2 DB 'Ingrese Segundo Numero: $'
        suma DB 0
		resta DB 0
		residuo DB 0
		multiplicacion DB 0
		division DB 0
        sumaPrint DB 'Total: $'
		restaPrint DB 'Diferencia: $'
		multiplicacionPrint DB 'Producto: $'
		divisionPrint DB 'Cociente: $'
		residuoPrint DB 'Residuo: $'
.STACK
.CODE                   
programa:               
    MOV AX, @DATA
    MOV DS, AX
	
	XOR AX,AX
    
	MOV DX, OFFSET numero1
    MOV AH, 09h
    INT 21h
	;leer numero1
	XOR AX,AX
	MOV AH, 01h
	INT 21h
	SUB AL,30h
	MOV Num1, AL
	
	MOV AH,02h		
	MOV DX, 10
	INT 21h
	
	MOV DX, OFFSET numero2
    MOV AH, 09h
    INT 21h

	;leer numero2
	XOR AX,AX
	MOV AH, 01h
	INT 21h
	SUB AL,30h
	MOV Num2, AL	
	
	MOV AH,02h		
	MOV DX, 10
	INT 21h
	
    ;suma
	XOR AX,AX
    MOV AL, num1
    ADD AL, num2
    MOV suma, AL
    
	;resta
	XOR AX,AX
    MOV AL, num1
    SUB AL, num2
    MOV resta, AL
	
	;multiplicacion
	XOR AX,AX
	MOV AL, num1
    MUL num2
    MOV multiplicacion, AL
	
	;division
	XOR AX,AX
	MOV AL, num1
    DIV num2
    MOV division, AL
	;residuo en AH
	MOV residuo, AH
	;impresion suma
    MOV DX, OFFSET sumaPrint
    MOV AH, 09h
    INT 21h
	
	MOV AL, suma
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
	
	MOV AH,02h		
	MOV DX, 10
	INT 21h	
	
	;impresion resta
	MOV DX, OFFSET restaPrint
    MOV AH, 09h
    INT 21h
    
    MOV AL, resta
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

    MOV AH,02h		
	MOV DX, 10
	INT 21h	
	
    ;impresion multiplicacion
	MOV DX, OFFSET multiplicacionPrint
    MOV AH, 09h
    INT 21h
    
    MOV AL, multiplicacion
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
	
	MOV AH,02h		
	MOV DX, 10
	INT 21h		
	
	;impresion division
	MOV DX, OFFSET divisionPrint
    MOV AH, 09h
    INT 21h
    
    MOV AL, division
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
	
	MOV AH,02h		
	MOV DX, 10
	INT 21h	
	
	;impresion residuo	
	MOV DX, OFFSET residuoPrint
    MOV AH, 09h
    INT 21h
    
    MOV AL, residuo
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

    MOV AH,4Ch      
    INT 21h         

End programa