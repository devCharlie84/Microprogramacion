.MODEL small
.DATA

  cadena1 DB 'Ingrese cadena 1: $'
  cadena2 DB 'Ingrese cadnea 2: $'
  diferentes DB 'Son diferentes! $'
  iguales DB 'Son Iguales! $'
  pilaCadena1 DB 100 dup(' '), '$'  ;reservamos 100 espacios en memoria 
  pilaCadena2 DB 100 dup(' '), '$' 	;reservamos 100 espacios en memoria

.STACK 
.CODE 
 
programa: 

	MOV AX,@DATA
	MOV DS,AX
	JMP IMPRIMIR_CADENA1
	
finalizar:
	MOV AH,04ch
	INT 21h

IMPRIMIR_CADENA1:
	MOV AH,09
	MOV DX,OFFSET cadena1 
	INT 21h
	
	LEA SI,pilaCadena1 		    ;se lee la variable pilaCadena1 en SI 
  
SET_CADENA1:
	MOV AH,01h  				;se captura el caracter
	INT 21h
  
	MOV [SI],AL  				;se mueve AL a la primera posicion de SI
	INC SI					    ;se incrementa SI
	CMP AL,0dh  				;se hace la comparacion presionando la tecla ENTER
	JA SET_CADENA1			    ;si es mayor salta a SET_CADENA1
	JB SET_CADENA1			    ;si es menor salta a SET_CADENA1

	;salto de linea
	MOV AH,02h		
	MOV DX, 10
	INT 21h
	

IMPRIMIR_CADENA2:
	MOV AH,09
	MOV DX,OFFSET cadena2  
	INT 21h
	
	LEA SI,pilaCadena2          ;se lee la variable pilaCadena2 en SI 

SET_CADENA2:    
	MOV AH,01h  				;se captura el caracter
	INT 21h
  
	MOV [SI],AL  				;se mueve AL a la primera posicion de SI
	INC SI					    ;se incrementa SI
	CMP AL,0dh  				;se hace la comparacion presionando la tecla ENTER
	JA SET_CADENA2			    ;si es mayor salta a SET_CADENA2
	JB SET_CADENA2			    ;si es menor salta a SET_CADENA2
  
  
	MOV CX,50   
	MOV AX,DS 
	MOV ES,AX 

COMPARAR_CADENAS: 
	LEA SI,pilaCadena1  		;se lee la variable pilaCadena2 en SI 
	LEA DI,pilaCadena2 			;se lee la variable pilaCadena2 en DI 
	REPE CMPSB  				;compara el byte de la direccion DS de SI con el byte de direccion de ES de DI
	JNE CADENAS_DIFERENTES 				
	JE CADENAS_IGUALES 

CADENAS_DIFERENTES:
	;salto de linea
	MOV AH,02h		
	MOV DX, 10
	INT 21h
	
	MOV AH,09
	MOV DX,OFFSET diferentes  
	INT 21h
	JMP finalizar
	
  
CADENAS_IGUALES:
	;salto de linea
	MOV AH,02h		
	MOV DX, 10
	INT 21h
	
	MOV AH,09
	MOV DX,OFFSET iguales 
	INT 21h
	JMP finalizar
	
end programa