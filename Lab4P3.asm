.MODEL small
.STACK
.DATA
    num1 DB ?
    num2 DB ?
    resta DB ?
	multiplicacion DB ?
	cociente DB ?
	residuo DB ?
    esigual DB 'Los numeros son iguales$' 
    mayor1 DB 'El primer numero es mayor$'
    mayor2 DB 'El segundo numero es mayor$'  
    ingresonum1 DB 'Ingrese Primer Numero: $'
    ingresonum2 DB 'Ingrese Segundo Numero: $'
	productoImp DB 'Producto: $'
    cocienteImp DB 'Cociente: $'
    residuoImp DB 'Residuo: $'
    
.CODE
programa: 
    MOV AX,@DATA
    MOV DS,AX
    
    JMP leernumeros
    finalizar:
    ;finalizar
    MOV AH,4Ch
    INT 21h
    
	;etiqueta leer numeros
    leernumeros:
    MOV DX, OFFSET ingresonum1
    MOV AH, 09h
    INT 21h
    ;leer num1
    XOR AX,AX
    MOV AH,01h
    INT 21h
    MOV num1,AL
    SUB num1,30h
    
    MOV AH,02h      
    MOV DX, 10
    INT 21h 
    
    ;leer num2
    MOV DX, OFFSET ingresonum2
    MOV AH, 09h
    INT 21h
    XOR AX,AX
    MOV AH,01h
    INT 21h
    MOV num2,AL
    SUB num2,30h
        
    MOV AH,02h      
    MOV DX, 10
    INT 21h 
	
	;etiqueta sumar (multiplicacion)
	sumar:
	MOV AL,multiplicacion
	ADD AL,num1
	MOV multiplicacion, AL
	INC BL
	CMP BL,num2
	JE ImprimirMultiplicacion
	JMP sumar
	
	
	;ImprimirMultiplicacion
    ImprimirMultiplicacion:
	;imprimir el producto
	MOV DX, OFFSET productoImp
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

	MOV cociente, 00H ;inicializo mi contador (cociente) en 0
	
    MOV AL, num1
	CMP AL,num2
	JLE ImprimirDivision
	MOV AL,num1
	MOV residuo,AL
	
	;etiqueta restar (division)
	restar:
	MOV AL,residuo
	SUB AL,num2
	MOV residuo, AL
	INC cociente
	MOV AL, residuo
	CMP AL,num2
	JGE restar
	JMP ImprimirDivision	
	
   ;ImprimirDivision
   ImprimirDivision:
   ;imprimir el cociente
	MOV DX, OFFSET cocienteImp
    MOV AH, 09h
    INT 21h
	
	MOV AL, cociente
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
	;imprimir el residuo
	MOV DX, OFFSET residuoImp
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
	
	JMP finalizar
	
	
end programa
