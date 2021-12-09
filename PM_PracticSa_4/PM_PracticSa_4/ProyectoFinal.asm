TITLE ProyectoU4
;DESCRPICIÓN 
;Objetivo:  
;
; Autore(s):
; catedratico   García Ruiz Alejandro H.
;	Alumno :	Gustavo antonio rivera

; Semestre: 8vo Semestre ISC 
;FIN_DESCRPICIÓN

INCLUDE Irvine32.inc  
INCLUDE MACROS.inc

.data
; Área de Declaración de Variables

;                           INDICE
palabras_20 db "PERRO",0    ; 0
			db "GATO-",0    ; 6
			db "OSO--",0    ; 12
			db "AZ---",0    ; 18
			db "FOCO-",0	; 24	 
			db "PAPAS",0    ; 30
			db "LAPIZ",0    ; 36

espacio_20 db "-",0;
palabraSeleccionada_20 db 15 dup(0) ;
contador_20 dword 0;
palabraEscondida_20 db 15 dup(0)   ; 
puntaje dword 10
concidencias dword 0
.code
	main20 PROC	
	;Lógica del Programa						
	;seleccion Aleatoria

		call randomize  ; establece la semilla para los numeros aleatorios
		mov eax, 7     ; cantidad de palabras
		call randomrange ; eax ; genera un aleatorio entre 0 y el valor de eax exclusivo
							 ;(Para este ejemplo del 0 al 6)
		mov ebx, 6     ;cantidad de caracteres máxima por palabra
		mul ebx  ; indice de palabra seleccionada * cantidad de caracteres
					 ; de esta manera en eax se almancerá el indice con el que comienza la palabra
					 ; que haya sido seleccionada aleatoriamente


		mov esi, offset palabras_20  ;ARREGLO DE PALABRAS
		add esi, eax     ; relacionado al indice de la palabra seleccionada
		mov edi, offset palabraSeleccionada_20 ;VARIABLE AUXILIAR
		mov ecx, 6  ; considerar el máximo numero de caracteres que puede tener la palabra

	ciclo:				
		mov ebx, edi  ;respaldo del valor de edi, para posteriormente realizar 
					  ;la comparacion de la cadena y ver si el caracter actual es un guion o no	
		mov edi, offset espacio_20
		cmpsb  ;compara esi con edi , para saber si el caracter actual es guion				
		jz detener   
		inc contador_20  
		dec esi										
		mov edi, ebx  ;recuperar el valor de edi (asociado al destino)
		mov eax, edi		
		movsb ;copiar el valor 
			loop ciclo
			dec contador_20
	detener:
		
		mov ecx, contador_20  ; tamaño de la palabra escogida
		mov edi, offset palabraEscondida_20
		mov eax, 0
		mov al, "."     
		rep stosb  ; incrementa automaticamente a edi en uno
				
		call crlf
		ImpPantallaLn "Palabra Escondida: "
		mov edx, offset palabraEscondida_20
		call writestring
		call crlf
			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			;;;."BUSCAR UNA LETRA EN LA PALABRA"
			;;;;;solicitar la letra a buscar
	;solicitarletra
	letras_escondidas:
		MOV EAX, 0
		call crlf
		ImpPantallaLn "Ingresa una Letra:  "
		CALL READCHAR  ; guarda el caracter leido en "al"
		CALL WRITECHAR
		CALL CRLF 

		ImpPantallaLn "La Letra ingresada es: "
		CALL WRITECHAR
		call crlf
		
		mov edi, offset palabraSeleccionada_20	;	para buscar el caracter ingresado			
		mov esi, offset palabraEscondida_20   ; si existe, se usara para reeemplazar al punto por su caracter
		mov ecx, contador_20 ;

	ciclo2:
		inc esi ; para mantener en el mismo indice a ambas palabras
		scasb  ; compara lo que esta en el acumulador con la memoria direccionada				
		jnz continuar  ; si no es igual
			dec esi  ; regresa al indice en el que fue igual
			xchg esi, edi; intercambia "seleccionada" por "escondida"
			stosb     				
			dec edi   ; se debe decrementar en uno, debido a que edi se incremento 
							  ; de manera automatica con stosb 
			xchg esi, edi ;se regresan las palabras nuevamente a como estaban al principio					
			inc esi
			inc concidencias
	continuar:					
			loop ciclo2
			call crlf
			ImpPantallaLn "Palabra Escondida: "
			mov edx, offset palabraEscondida_20
			call writestring
			call crlf
			jmp Comparar
			
	Comparar:
			mov ecx,concidencias
			cmp contador_20,ecx
			jnz sinoesigual
			jz siesigual
			
		siesigual:
			call crlf
			ImpPantallaLn " GANASTE !!! "
			jmp Salir


	sinoesigual:
			dec puntaje
			mov eax,puntaje
			ImpPantalla  "puntuacion:"
			call writedec
			call crlf
			jmp Fin
	Fin:
			cmp puntaje,0
			jz sale
			jnz respuesta
	gameover:
		call crlf
		ImpPantallaLn "ya fuiste"
		ImpPantalla  "el resultado esperado era: "
		mov edx, offset palabraSeleccionada_20
		call writestring
		call crlf	
	respuesta:
				jmp letras_escondidas
	Salir:
		exit	
	main20 ENDP
	END main20