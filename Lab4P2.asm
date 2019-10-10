.MODEL small
.STACK
.DATA
    num1 DB ?
    num2 DB ?
    resta DB ?
    esigual DB 'Los numeros son iguales$' 
    mayor1 DB 'El primer numero es mayor$'
    mayor2 DB 'El segundo numero es mayor$'  
    ingresonum1 DB 'Ingrese Primer Numero: $'
    ingresonum2 DB 'Ingrese Segundo Numero: $'
    
.CODE
programa: 
    MOV AX,@DATA
    MOV DS,AX
    
    JMP leernumeros
    finalizar:
    ;finalizar
    MOV AH,4Ch
    INT 21h
    
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

    XOR AX,AX
    MOV AL, num1
    SUB AL, num2
    MOV resta, AL
    
    ;Comprarar
    CMP resta,0
    JZ soniguales
    JNZ nosoniguales

    soniguales:
    MOV DX, OFFSET esigual
    MOV AH, 09h
    INT 21h
    JMP finalizar
    
    nosoniguales:
    JS mayornum2
    JNS mayornum1
    
    mayornum1:
    MOV DX, OFFSET mayor1
    MOV AH, 09h
    INT 21h
    JMP finalizar
    
    mayornum2:
    MOV DX, OFFSET mayor2
    MOV AH, 09h
    INT 21h
    JMP finalizar
    
end programa
