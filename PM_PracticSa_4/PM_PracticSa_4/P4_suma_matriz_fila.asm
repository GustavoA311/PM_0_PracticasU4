TITLE suma_fila

;DESCRPICI�N 
;Objetivo: suma de filas 
;
; Autore(s):
;Autore(s):
;         Gustavo Antonio
;catedr�tico: Alejandro Garc�a Ruiz 

; Semestre: 8vo Semestre ISC 
;FIN DESCRPICI�N

INCLUDE Irvine32.inc  
INCLUDE MACROS.inc

.data
; �rea de Declaraci�n de Variables
arreglo_p10 dword 10, 12, 15, 20
		    dword  7,  5, 10, 12
			dword  1,  2,  3,  4

filas_p10 dword 4
columnas_p10 dword 3



.code
	main4 PROC	
		;L�gica del Programa
		mov ecx, columnas_p10
		mov edi, 0
		
	CicloColumnas:
		push ecx
		mov ecx, filas_p10
		mov esi, 0
		mov ebx, 0
		
	CicloFilas:	  
		mov eax, arreglo_p10[esi+edi]
		add ebx, eax
		add esi, 4
	loop CicloFilas
		
		divide edi, filas_p10
		Division  4
		inc eax

		ImprimirResultado "La sumatoria de la fila ", eax
		ImprimirResultadoLn " es: ", ebx 
	
		
		add edi, esi
		pop ecx
		loop CicloColumnas

		exit	
	main4 ENDP
	END main4