.MODEL small
.DATA
    usuario DB 'Presione la tecla "ENTER" para terminar el ciclo$'
.CODE

programa:
    MOV AX, @DATA
    MOV DS, AX
    
    MOV DX, Offset usuario
    MOV AH, 09h
    INT 21h
    
    MOV AH, 01
    INT 21h
    
    LOOPX:
    MOV DL, 58h
    MOV AH, 02h
    INT 21h
  
    MOV AH, 01          
    INT 16h             ;interrupcion de teclado
    LOOPZ LOOPX         ;salta si la bandera Z es 1 y el contador CX es diferente a 0

    CMP AL, 0dh         ;compara si el valor de  AL es la tecla ENTER
    JZ Finalizar        ;si es ENTER finaliza el LOOP
    LOOP LOOPX          ;de lo contrario sigue el LOOP 
       
    ; finalizar
    finalizar:
    MOV AH, 4ch
    INT 21h
    
END programa