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
matriz  dword 10, 12, 15, 20
		dword  7,  5, 10, 12
		dword  1,  2,  3,  4

Mmenor db "menor",0
Mmayor db "mayor", 0

matriz_res dword 3 dup(0)
           dword 3 dup(0)

filas dword 4
columnas dword 3
.code
	main5 PROC	
	;Lógica del Programa

		mov ecx, columnas
		mov edi, 0
		mov eax, matriz[0]
		mov matriz_res[0],eax
		mov matriz_res[12],eax
		
	CicloColumnas:
		push ecx
		mov ecx, filas
		mov esi, 0
		
    CicloFilas:	
		mov eax, matriz[edi+esi]
		mov ebx, 0
		cmp eax, matriz_res[ebx]
		jl carga

		mov ebx, 12
		cmp eax, matriz_res[ebx]
		jg carga
		jmp Next
         
	carga:
		mov matriz_res[ebx], eax
			   
		divide edi, filas
		Division 4
		mov matriz_res[ebx+4], eax

		divide esi, 4
		mov matriz_res[ebx+8], eax
			   
	 Next:
		add esi, 4
		loop CicloFilas
		
		add edi, esi
	
		pop ecx
		dec ecx
		jnz CicloColumnas

		mov ecx, 2
		mov edi, 0
		push offset Mmayor
		push offset Mmenor


	Cicloinprime:
		 
		ImprimirCadena "El numero "
		 pop edx
		 call writestring
		 ImprimirResultadoLn " es ", matriz_res[edi]

		 add edi, 4
		 ImprimirResultado "Esta en la Fila ", matriz_res[edi]

		 add edi, 4
		 ImprimirResultadoLn ", Columna ", matriz_res[edi]

		 add edi, 4
		 call crlf
       loop Cicloinprime
	
		exit	
	main5 ENDP
	END main5