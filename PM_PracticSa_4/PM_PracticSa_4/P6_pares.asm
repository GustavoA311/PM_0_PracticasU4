TITLE suma_matriz

;DESCRPICIÓN 
;Objetivo: suma de filas 
;
; Autore(s):
;Autore(s):
;         Gustavo Antonio
;catedrático: Alejandro García Ruiz 

; Semestre: 8vo Semestre ISC 
;FIN DESCRPICIÓN

INCLUDE Irvine32.inc  
INCLUDE MACROS.inc
.data
; Área de Declaración de Variables
matriz_1 dword 10, 12, 15, 20
		 dword  7,  5, 10, 12
		 dword  1,  2,  3,  4

filas dword 3
columnas dword 4
par dword 2
.code
	main6 PROC	
	;Lógica del Programa
	mov ebx, 0
	mov ecx, 11

siesmayor:
	mov eax, dword ptr[matriz_1+ecx*4]
	push eax
	mov edx, 0
	div par
	pop eax

    cmp edx, 0
	jne sinoesigual
	inc ebx
	push eax

sinoesigual:
	dec ecx
	cmp ecx, 0
	jge siesmayor

   ciclo:
	cmp ebx, 0
	je fin
	dec ebx
	pop eax
	call writeint
	jmp ciclo
	
	fin:
		exit	
	main6 ENDP
	END main6