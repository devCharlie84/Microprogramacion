.MODEL SMALL
.DATA
    decenas DB ?
    unidades DB ?
    ingresoNumero DB 'Ingrese un numero: $'
    factores DB 'Factores: $'
	diez DB 10d
	
.STACK
.CODE

programa:
    MOV AX,@DATA
    MOV DS,AX
	
    XOR AX,AX
    MOV DX, OFFSET ingresoNumero
    MOV AH,09h
    INT 21h
	
    MOV DL,20h
    MOV AH,02h
    INT 21h
	
    MOV AH,01h
    INT 21h
    MOV decenas,AL
    SUB decenas,30h
	
    XOR AX,AX
    MOV AL,10d
    MUL decenas ;se multiplica por 10 ya que son las decenas   
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
	
    XOR AX,AX
    MOV AX,03h
    INT 10h
	
    XOR AX,AX
    MOV DX,OFFSET factores
    MOV AH,09h
    INT 21h
	
    XOR DX,DX
    MOV DL,0dh
    MOV AH,02h
    INT 21H    
	
    MOV DL,10
    MOV AH,02h
    INT 21h
    MOV CL,unidades
    
	;sacar facto
    DividirUnidades:
    XOR AX,AX    
    MOV AL,unidades    
    DIV CL
	
    CMP AH,0h
    JE  ImprimirFactores
    JNE CICLO
	
    ;LOOP CICLO	
	CICLO:
    LOOP DividirUnidades    
    JMP finalizar

	;imprimirFactores
    ImprimirFactores:        
    XOR AX,AX
    MOV AL,CL
    DIV diez
	
    XOR BX,BX    
    MOV BL,AL
    MOV BH,AH
    ADD BL,30h
    MOV DL,BL
    MOV AH,02h
    INT 21h
	
    ADD BH,30h
    MOV DL,BH
    MOV Ah,02h
    INT 21h
	
    MOV DL,0dh
    INT 21h
	
    MOV DL,10
    MOV AH,02h
    INT 21h   
	
    JMP CICLO
	
;finalizar	
finalizar:
    MOV AH,4ch
    INT 21h   
    
end programa