.MODEL small

.DATA
;variable que contiene el texto que queremos mostrar
cadena DB'Hola Mundo$' ; $ significa el final de la cadena

.STACK
.CODE

Programa:     ; etiqueta de inicio de programa
;inicializar programa
MOV AX, @DATA ;guardando direccion de inicio segmento de datos
MOV DS, AX

; Imprimir cadena
MOV DX, OFFSET cadena  ; asignando a DX la variable cadena
MOV AH, 09h            ; decimos que se imprimira una cadena
INT 21h                ; ejecuta la interrupcion

;finalizar programa
MOV AH, 4ch ; finalizar proceso
INT 21h     ; ejecuta la interrupcion
END Programa