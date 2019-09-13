.MODEL small

.DATA
;variable que contiene el texto que queremos mostrar
nombre DB'Carlos Morales$' ; $ significa el final de la cadena
carnet DB'1171316$' ; $ significa el final de la cadena

.STACK
.CODE

Programa:     ; etiqueta de inicio de programa
;inicializar programa
MOV AX, @DATA ;guardando direccion de inicio segmento de datos
MOV DS, AX

; Imprimir cadena
MOV DX, OFFSET nombre  ; asignando a DX la variable cadena
MOV AH, 09h            ; decimos que se imprimira una cadena
INT 21h                ; ejecuta la interrupcion


MOV AH,02h		
MOV DX, 10
INT 21h		

; Imprimir cadena
MOV DX, OFFSET carnet  ; asignando a DX la variable cadena
MOV AH, 09h            ; decimos que se imprimira una cadena
INT 21h                ; ejecuta la interrupcion

;finalizar programa
MOV AH, 4ch ; finalizar proceso
INT 21h     ; ejecuta la interrupcion
END Programa