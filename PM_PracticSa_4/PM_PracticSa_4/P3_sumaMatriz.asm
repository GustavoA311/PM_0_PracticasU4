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
arreglo dword 10, 12, 15, 20
		dword  7,  5, 10, 12
		 dword  1,  2,  3,  4

filas dword 3
columnas dword 4

.code
	main3 PROC	
	;Lógica del Programa
		
		mov ecx, 0 ; contador para las iteraciones
		recorrido_fila:			
				mov eax, ecx   ; mueve al indiceFila deseado a edi, para poder multiplicar
				mov ebx, 4     ; total de bytes de cada elemento del arreglo (tamaño del tipo de dato)
				mul ebx        ; multiplica por el total de bytes que tiene cada elemento en el arreglo 
				mul columnas ; (4 * indiceFila) * totalColumnas
				mov edi, eax  
				push ecx
				mov ecx, 0  ; contador auxiliar para las columnas

			recorrido_columna:
				
				mov eax, ecx		
				mov ebx, 4
				mul ebx
				mov esi, eax ; posicionamiento en edi de la localidad de memoria asociada al indice
				mov eax, arreglo[edi + esi]  ;acceso a la fila y columna "deseada"

				call writedec
				ImpPantalla " - "
		
				inc ecx
				cmp ecx, columnas
				jl recorrido_columna
				call crlf

				pop ecx ; recupera el contador de filas que se encuentra en la pila/stack
				inc ecx
				cmp ecx, filas
				jl recorrido_fila


			sumatoria:
				mov ecx, 3
				mov edi, 0
				mov ebx, 0

		
			CicloColumnas:
				push ecx
				mov ecx, 4
				mov esi, 0

			CicloFilas:	  
				mov eax, arreglo[esi+edi]
				add ebx, eax
				add esi, 4

			loop CicloFilas

				add edi, esi	
				pop ecx
				loop CicloColumnas
				ImprimirResultadoLn "El resultado las suma de la matriz  es: ", ebx
		
		exit	
	main3 ENDP
	END main3