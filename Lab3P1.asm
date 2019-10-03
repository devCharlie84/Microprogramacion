.MODEL small            
.DATA
        num1 DB 4
        num2 DB 2
		numero1 DB 'Primer Numero: 4$'
		numero2 DB 'Segundo Numero: 2$'
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
	
    MOV AL, num1
    MOV num1, AL
    
	XOR AX,AX
    MOV AL, num2
    MOV num2, AL

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
	MOV residuo, AH
	
	;impresion numero1
	MOV DX, OFFSET numero1
    MOV AH, 09h
    INT 21h
	
	MOV AH,02h		
	MOV DX, 10
	INT 21h	
	
	;impresion numero2
	MOV DX, OFFSET numero2
    MOV AH, 09h
    INT 21h
	
	MOV AH,02h		
	MOV DX, 10
	INT 21h	
	
	;impresion suma
    MOV DX, OFFSET sumaPrint
    MOV AH, 09h
    INT 21h
	
    MOV DL, suma
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
    
    MOV DL, resta
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
    
    MOV DL, multiplicacion
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
    
    MOV DL, division
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
    
    MOV DL, residuo
    ADD DL,30h
    MOV AH,02h
    INT 21h	

    MOV AH,4Ch      
    INT 21h         

End programa