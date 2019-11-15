.386
;model
.MODEL FLAT, STDCALL
OPTION CASEMAP:NONE

;includes
;include \masm32\include\windows.inc
;include \masm32\include\kernel32.inc
;include \masm32\include\masm32.inc
;include \masm32\include\masm32rt.inc

;librerias
;includelib \masm32\lib\kernel32.lib
;includelib \masm32\lib\masm32.lib
include Irvine32.inc

.DATA
num dword ?
Ingreso	BYTE	"Ingrese un numero: ",0

contadorFactorial dword 0

resultadoFactorial dword 1
resultado db "Factorial: ",0

.CODE

Programa:

main proc

	 MOV EDX,OFFSET Ingreso
	 CALL WriteString
	 CALL ReadInt
	 MOV num,EAX

Set_Factorial:
	 MOV EAX,contadorFactorial
	 ADD EAX,1
	 MOV contadorFactorial,EAX

	 MOV ECX,resultadoFactorial
	 MOV EAX,contadorFactorial
	 MUL ECX
		
	 MOV resultadoFactorial,EAX
	 MOV EAX,contadorFactorial

	 CMP EAX,num
	 JZ Get_Factorial
	 JMP Set_Factorial

Get_Factorial:
	 MOV EDX,OFFSET resultado
	 CALL WriteString
	 MOV EAX, resultadoFactorial
	 CALL WriteDec

finalizar:	
	CALL ReadChar
	INVOKE ExitProcess,0

main endp


END Programa