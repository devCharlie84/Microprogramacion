.MODEL SMALL
.DATA
		cadena DB 100 DUP(?)
		ingreso DB 'Ingrese una cadena en minuscula con o sin espacios: $'
.STACK
.CODE
programa:
	MOV AX,@DATA
	MOV DS,AX
    
    LEA DX, ingreso
    MOV AH, 09H
    INT 21H
	
	;salto de linea
	MOV AH,02h		
	MOV DX, 10
	INT 21h
	
	LEA SI, cadena					;se lee la variable cadena en SI
	
SET_CADENA:
    MOV AH, 01H						;se captura el caracter
    INT 21H
	
    CMP AL, 0DH						;Se hace la comparacion presionando la tecla ENTER
    JE CONVERTIR
	
	CMP AL,20H                      ;se compara con la tecla  ESPACIO
	JE ESPACIO                      ;si es igual salta a la etiqueta ESPACIO

	CMP AL,61H                      ;se hace la comparacion a minuscula
	JB SET_CADENA                   

	CMP AL,7AH                      ;se compara con z minuscula
	JA SET_CADENA 

	SUB AL,20H                      ;Se resta 20H para obtener el ASCCI de la letra en mayuscula
	MOV [SI],AL                     ;Se mueve AL a la primera posicion de SI
	INC SI                          ;Se incrementa SI
	JMP SET_CADENA  
    
ESPACIO:
	INC SI							;si es ESPACIO solo incrementa SI
	JMP SET_CADENA
	
CONVERTIR:
    MOV CX,0H	
	CMP SI,CX                                       
	JE SET_CADENA                                    

	INC SI                                          
	MOV AL,'$'                                      
	MOV [SI],AL                                     

	;ya convertido a mayuscula
	MOV AH,09H
	LEA DX,cadena
	INT 21H

finalizar:
	MOV AH,4ch
	INT 21h
    
end programa