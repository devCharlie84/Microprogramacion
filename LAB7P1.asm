.386;
.MODEL FLAT, STDCALL
OPTION CASEMAP:NONE

INCLUDE Irvine32.inc		;libreria de MASM que permite realiza metodos de ESCRITURA/LECTURA

.DATA
	;0 Delimitador de cadena para MASM
	ingresoNum1	BYTE "Numero 1: ",0
	num1 dword 0
	ingresoNum2	BYTE "Numero 2: ",0
	num2 dword 0

	suma dword 0
	msgSuma db  0ah,0dh, "Suma: ",0		
	resta dword 0
	msgResta db 0ah,0dh,"Resta: ",0 	

	;0ah,0dh es salto de linea
	sonIguales db 0ah,0dh,"Los numeros son iguales",0
	mayorNum1 db  0ah,0dh,"Numero 1 es mayor",0
	mayorNum2 db  0ah,0dh,"Numero 2 es mayor",0

.CODE
;se empieza con el proceso main
main proc
	MOV EDX,OFFSET ingresoNum1
	CALL WriteString
	CALL ReadInt
	MOV num1,EAX
	
        MOV EDX,OFFSET ingresoNum2
	CALL WriteString
	CALL ReadInt
	MOV num2,EAX

	MOV EAX,num1
	ADD EAX,num2
	MOV suma,EAX	
	
	MOV EAX,num1
	SUB EAX,num2
	MOV resta,EAX
	
        MOV EDX,OFFSET msgSuma
	CALL WriteString

        MOV EAX, suma
	CALL WriteDec

	MOV EDX,OFFSET msgResta
	CALL WriteString

	MOV EAX, resta
	CALL WriteDec

	MOV EAX,num1
	CMP EAX,num2
	JC mayorNumero2
	JZ iguales
	JNZ mayorNumero1

	iguales:
	MOV EDX,OFFSET sonIguales
	CALL WriteString
	JMP finalizar

	mayorNumero1:
	MOV EDX,OFFSET mayorNum1
	CALL WriteString
	JMP finalizar

	mayorNumero2:
	MOV EDX,OFFSET mayorNum2
	CALL WriteString
	JMP finalizar

	finalizar:	
	CALL ReadChar
	
	;finalizaralizar
	INVOKE ExitProcess,0

;fin del proceso main
main endp
end main	