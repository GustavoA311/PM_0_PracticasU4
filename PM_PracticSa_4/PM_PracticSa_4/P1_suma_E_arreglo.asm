TITLE sumaArreglo

;DESCRPICI�N 
;Objetivo: Archivo de Ejemplo
;
;Autore(s):
;         Gustavo Antonio
;catedr�tico: Alejandro Garc�a Ruiz 
; Semestre: 8vo Semestre ISC 
;FIN DESCRPICI�N

INCLUDE Irvine32.inc  
INCLUDE MACROS.inc

.data
; �rea de Declaraci�n de Variables
arreg1o1 byte 20 dup(0)
arreg1o2 byte 20 dup(0)
arreglosuma byte 20 dup(0)
.code

	main1 PROC
	; logica del programa
	    mov edi, 0
		mov eax, 0

		ImpPantallaLn "Ingrese el tama�o  "; mensaje
        call readint
		push eax
		mov ecx, eax

		CicloArreglo:
		   ImpPantallaLn "Ingrese un dato"; mensaje
		   call readdec
		   mov arreg1o1[edi], al
		   inc edi

		loop CicloArreglo
		call crlf

		pop ecx
		push ecx
		mov edi,0
		mov edx, 0

		Arreglo:
		   ImpPantallaLn "ingrese un dato"; mensaje
		   call readdec
		   mov arreg1o2[edi], al
		   
		   mov dl, arreg1o1[edi]
		   add dl, al
		   mov arreglosuma[edi], dl
		   inc edi

		loop arreglo

		pop ecx
		mov edi, 0
		call crlf

		Cicloimprime:
		  mov al, arreglosuma[edi]
		  call writedec
		  ImprimirCadena " "
		  inc edi

		loop Cicloimprime
		
		exit	
	main1 ENDP
	END main1