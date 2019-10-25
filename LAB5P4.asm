.MODEL SMALL
.DATA
    decenas DB ?
    unidades DB ?
	diez DB 10d ;variable para multiplicar el numero1 y pasarlo a decenas
    dos  DB 2d  ;variable para dividir el numero y convertir a binario
	ingresoNumero DB 'Ingrese un numero: $'
    acumulador DB ?
    binario DB 9 dup(' '),'$'

.STACK
.CODE

programa:
	JMP leernumero
	
;finalizar	
finalizar:
	MOV DX,OFFSET binario
	MOV AH,09h
	INT 21h
	
	MOV AH,4ch
	INT 21h

;leer numero
leernumero:
	MOV AX,@DATA
    MOV DS,AX
	
	;leer dos numeros y calcular las unidades y decenas
    XOR AX,AX
    MOV DX,OFFSET ingresoNumero
    MOV AH,09h
    INT 21h
	
    MOV DL,20h
    MOV Ah,02h
    INT 21h
	
    MOV AH,01h
    INT 21h
	
    MOV decenas,AL
    SUB decenas,30h
	
    XOR AX,AX
    MOV AL,diez
    MUL decenas    
    MOV BL,AL
	
    XOR AX,AX
    MOV AH,01h  
    INT 21h
	
    MOV unidades,AL
    SUB unidades,30h
    ADD BL,unidades
    MOV unidades,BL
    MOV DL,10
    MOV AH,02h
    INT 21h
    
    MOV SI,6
    XOR AX,AX
    MOV AL,unidades
    DIV dos
    MOV acumulador,AL
    CALL ADD_STACK
	
    CMP acumulador, 0      
    JG  START_COUNTER 
    JMP finalizar

;START_COUNTER	
START_COUNTER:        
    XOR CX,CX    
    MOV CL,1    
    
;BINARY_LOOP	
BINARY_LOOP:    
    XOR AX,AX
    MOV AL,acumulador
    DIV dos
    MOV acumulador,AL
    CALL ADD_STACK
	
    CMP acumulador, 0
    JG Incrementar  
	
;CICLO	
CICLO:
    LOOP BINARY_LOOP    
    JMP finalizar 

;Procedimiento	
ADD_STACK PROC    
    XOR DX,DX        
    MOV DL,AH
    ADD DL,30h
    MOV binario[SI],DL
    DEC SI
    RET
;fin de Procedimiento
ADD_STACK endp   

;incrementar Contador
Incrementar:
    INC CL
    JMP CICLO

  
end programa