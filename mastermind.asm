; Juego del mas famoso MASTER MIND juego del mundo
; Practica de NASM de Junio de 2024
; Realisado por Illia Bilyi y Theo Helman Quesada

section .data

		ESC_Borrar db 27,"[2J"                   ; Borrar Pantalla - (PREPROGRAMADA)
		L_ESC_Borrar equ $ - ESC_Borrar 
		
		ESC_Normalizar db 27,"[0m"               ; NORMALIZAR la visualización por pantalla - (PREPROGRAMADA)
		L_ESC_Normalizar equ $ - ESC_Normalizar		
				
		PonerNegrita db 27,"[1m"         ; Pone el texto en NEGRITA - (PREPROGRAMADA)
		LPonerNegrita equ $ - PonerNegrita
		
		Negro db 27,"[48;5;0m"                      ; FONDO Negro (0) - (PREPROGRAMADA)
		LNegro equ $ - Negro		
		
		Blanco db 27,"[48;5;15m"                    ; FONDO Blanco (15) - (PREPROGRAMADA)
		LBlanco equ $ - Blanco	
			
		Gris db 27,"[48;5;249m"                     ; FONDO Gris (243) - (PREPROGRAMADA)
		LGris equ $ - Gris		

		AzulClaro db 27,"[48;5;14m"                 ; FONDO Azul Claro (14) - 1 - (PREPROGRAMADA)
		LAzulClaro equ $ - AzulClaro
		
		AzulOscuro db 27,"[48;5;21m"                ; FONDO Azul Oscuro (21) - 2 - (PREPROGRAMADA)
		LAzulOscuro equ $ - AzulOscuro		
		
		Naranja db 27,"[48;5;202m"                  ; FONDO Naranja (202) - 3 - (PREPROGRAMADA)
		LNaranja equ $ - Naranja		

		Rojo db 27,"[48;5;196m"                     ; FONDO Rojo (196) - 4 - (PREPROGRAMADA)
		LRojo equ $ - Rojo

		Amarillo db 27,"[48;5;226m"                 ; FONDO Amarillo (226) - 5 - (PREPROGRAMADA)
		LAmarillo equ $ - Amarillo

		Violeta db 27,"[48;5;54m"                   ; FONDO Violeta (54) - 6 - (PREPROGRAMADA)
		LVioleta equ $ - Violeta

		Verde db 27,"[48;5;34m"                     ; FONDO Verde (34) - 7 - (PREPROGRAMADA)
		LVerde equ $ - Verde

		Rosa db 27,"[48;5;200m"                     ; FONDO Rosa (200) - 8 - (PREPROGRAMADA)
		LRosa equ $ - Rosa
					
        ColorMasterMind db 27,"[1;90;106m"                 ; 1 = NEGRITA, 90 = Letras en NEGRO y 50 = Fondo en VERDE CLARO - (PREPROGRAMADA)
		LColorMasterMind equ $ - ColorMasterMind
		
		MasterMind db "* * * M A S T E R  M I N D * * *"    ;  - (PREPROGRAMADA)
		LMasterMind  equ $ - MasterMind
		
		CadenaNumero db "   "                               ;  - (PREPROGRAMADA)
		LCadenaNumero equ $ - CadenaNumero
		
		CadenaNumero1 db "  "                               ;  - (PREPROGRAMADA)
		LCadenaNumero1 equ $ - CadenaNumero1

; **********************************************************************

		Fila        db  0           ;  - (PREPROGRAMADA)
		T_Fila      db  0           ;  - (PREPROGRAMADA)
		X_Fila      db  0           ;  - (PREPROGRAMADA)
		Columna     db  0           ;  - (PREPROGRAMADA)
		T_Columna   db  0           ;  - (PREPROGRAMADA)
		Y_Columna   db  0           ;  - (PREPROGRAMADA)
		
		N_Filas     db  0           ;  - (PREPROGRAMADA)
		N_Columnas  db  0           ;  - (PREPROGRAMADA)
		
		Bloque   db  " "		    ;  - (PREPROGRAMADA)
	
		Posicion db 27,"[12;02H"           ;  - (PREPROGRAMADA)
		L_Posicion equ $ - Posicion
		
		Salto_Linea   db  10, 13
		
		ENTER_Pausa db " "           ;  - (PREPROGRAMADA)
		
	TextoNumero  db " "          ;  - (PREPROGRAMADA)
		
		Barra db "|"                 ;  - (PREPROGRAMADA)
		
		Color_Fila db 0              ;  - (PREPROGRAMADA)
		
		TotalNegros db 0             ;  - (PREPROGRAMADA)
		TotalGrises db 0             ;  - (PREPROGRAMADA)

; **********************************************************************		
		
		PosicionesNegrosGrises times 6 db 42, 45, 48, 51, 54, 57           ;  - (PREPROGRAMADA)
		
		PosicionesColores times 6 db 62, 65, 68, 71, 74, 77                ;  - (PREPROGRAMADA)
		
; **********************************************************************	
	
    msg2 db "Introduce CADENA:"
    Lmsg2 equ $ - msg2 
    Posicion2 db 27,"[12;02H"
    LPosicion2 equ $ - Posicion2

    msg1 db "Introduce 6 numeros correspondintes a los colores:"
    Lmsg1 equ $ - msg1
    posicion1 db 27,"[12;02H"
    Lposicion equ $ - posicion1

    error1 db "Error – El número de colores es DISTINTO de 6"
    Lerror1 equ $ - error1

    posicion_error1 db 27,"[14;02H"
    Lposicion_error1 equ $ - posicion_error1


    error2 db "ERROR – Los números no van del 1 al 8"
    Lerror2 equ $ - error2


    posicion_error2 db 27,"[14;02H"
    Lposicion_error2 equ $ - posicion_error2

    ganado db "***HAS GANADO***"
    Lganado equ $ - ganado

    posicion_ganado db 27, "[14;02H"
    Lposicion_ganado equ $ - posicion_ganado

    perdido db "***HAS PERDIDO***"
    Lperdido equ $ - perdido

    posicion_otraj db 27, "[16;02H"
    Lposicion_otraj equ $ - posicion_otraj

    otraj db "¿Quieres Salir(S/N)?"
    Lotraj equ $ - otraj

    posSN db 27, "[17;02H"
    LposSN equ $ - posSN

    lasterror db "* * ERROR * *"
    Llasterror equ $ - lasterror

    poslimp db 27, "[12;19H"
    Lposlimp equ $ - poslimp
    limpiarLinia db "               "
    



section .bss

		TotalNumeros         resb  10           ;  - (PREPROGRAMADA)
		TotalCADENAColores   resb  10          ;  - (PREPROGRAMADA)
        SN                   resb  2           ; Si o NO					
section .text
	global _start
	
_start:

	Call Borrar_Pantalla	            ; Borra la Pantalla  - (PREPROGRAMADA)
	
	Call Poner_Registros_a_Cero         ; Coloca los registros más utilizados a 0  - (PREPROGRAMADA) 
	
	Call SuperBloque1                   ; Visualiza por Pantalla el contenido del SuperBloque1  - (PREPROGRAMADA) 
	
; *************************** PROCESO A REALIZAR POR EL ALUMNO **************************************************************	
;                                                                                                                           *
;	En este proceso el alumno po     Call Pausardría gesgtionar los números que se van a introducir en "TotalNumero", comprobando  			*
;   los errores que se puedan cometer																						*
;                                                                                                                           *
;                                                                                                                           *
; ***************************************************************************************************************************

; **********************************************************************
; **********************************************************************
; **********************************************************************



continuar_programa:; esperamos la cadena jugada y buscamos errores si hay   
    mov ecx, posicion1
    mov edx, Lposicion
    Call Imprimir


    mov ecx, msg1
    mov edx, Lmsg1
    Call Imprimir
   
      

    mov ecx, TotalNumeros
    mov edx, 10
    Call Leer 


    mov bl, 0
    mov esi, 0          

      
    count:;bucle para saber si longitud esta bien - 6
        cmp BYTE[TotalNumeros + esi], 0; 0 es fin de cadena 
        je check_length; si son iguales (fin cadena) check longitud
        inc esi; increments el contador para seguir el bucle
        cmp esi, 7; si contador es mayor  7 dar error
        jg error

        
        jmp count; volver al bucle 
        
        check_length:
            cmp esi, 7 ; si es men            
            jl error
            jmp check_symb                        
            

        error:; error de longitud incorecta           

            mov ecx, posicion_error1
            mov edx, Lposicion_error1
            Call Imprimir

            mov ecx, error1
            mov edx, Lerror1
            Call Imprimir
            Call Pausar
            mov esi, 0

            limpiar_total:; bucle para limpiar TotalNumeros si da error podemos introducir de nuevo los datos y comparar de nuevo
                mov BYTE[TotalNumeros + esi], 0
                inc esi
                cmp esi, 10  
                jl limpiar_total

            jmp _start
            

        
            

check_symb:;comprobamos que los caracteres estan entre 1 y 8
    mov esi, 0
    check_bucle:; compara cada elemenmto si esta entre 1 y 8
        
       cmp BYTE[TotalNumeros+ esi], '1' ;comparams el caracter en la posicion coloreselegidos + esi, si es mayor que que 1 continua el programa si no salta el error
       jl error_symb
       cmp BYTE[TotalNumeros+ esi], '8' ;compara con 8 para saber si es mayor, si es salta el error si no incrementamos esi para comprobar el siguiente caracter de la cadena 
        jg error_symb 
        inc esi
        cmp esi, 6; si esi = 5, vamos al siguiente paso si no comprueba el bit siguiente
        jl check_bucle
        jmp Seguir; vamos al parte de Seguir donde empiezza juego
       

    error_symb:; error si el numero no esta entre 1 y 8

            mov ecx, posicion_error2
            mov edx, Lposicion_error2
            Call Imprimir

            mov ecx, error2
            mov edx, Lerror2
            Call Imprimir
            Call Pausar
            Call _start ; si no salta es porque hay error jugando y acaba programa

PedirCadena:;para que el jugador introduzca cadena a comprobar
            mov ecx, Posicion2
            mov edx, LPosicion2
            Call Imprimir


            mov ecx, msg2       ; mensaje para que introduzca CADENA
            mov edx, Lmsg2
            Call Imprimir
            
          
            mov ecx, TotalCADENAColores ; leemos cadena a comprobar
            mov edx, 10
            Call Leer

            mov ecx, poslimp
            mov edx, Lposlimp
            Call Imprimir


            mov ecx, limpiarLinia       ; mensaje para que introduzca CADENA
            mov edx, 10
            Call Imprimir

           

            mov esi, 0 
           
           
            jmp count2

   count2:;comparamos si longitud de cadena de usuario es 6
        cmp BYTE[TotalCADENAColores + esi], 0; comparamo si es fin de cadena
        je check_length2; si son iguales (fin cadena) check longitud
        inc esi; increments el contador para seguir el bucle
        cmp esi, 7; si contador es mayor o igual 7 dar error
        ja error_2

        
        jmp count2; volver al bucle 
        
        check_length2:;comparamos si no es menor que 6
            cmp esi, 6        
            jl error_2
            jmp check_symb2                        
            

        error_2:;si longitud no es 6 visualizamos el error y salimos finalizamos la ejecuatacion
           


            mov ecx, posicion_error1
            mov edx, Lposicion_error1
            Call Imprimir

            mov ecx, lasterror
            mov edx, Llasterror
            Call Imprimir
            mov esi, 0

            Call Pausar

            mov ecx,posicion_error2 
            mov edx, Lposicion_error2
            Call Imprimir


            mov ecx, limpiarLinia
            mov edx, Llasterror
            Call Imprimir

            
            jmp PedirCadena

        check_symb2:;comprobamos que los caracteres estan entre 1 y 8
           mov esi, 0
            check_bucle2:; comparar si el numero esta entre 1 y 8
        
                cmp BYTE[ TotalCADENAColores + esi], '1' ;comparams el caracter en la posicion coloreselegidos + esi, si es mayor que que 1 continua el programa si no salta el error
                jl error_2
                cmp BYTE[ TotalCADENAColores + esi], '8' ;compara con 8 para saber si es mayor, si es salta el error si no incrementamos esi para comprobar el siguiente caracter de la cadena 
                ja error_2 
                inc esi
                cmp esi, 6; si esi = 5, vamos al siguiente paso si no comprueba el bit siguiente
                jl check_bucle2
                jmp CompararCadenas 
       

           


CompararCadenas:; comprobar dos cadenas (negros, gris)
    mov esi, 0   ;empezamos comparar numeros de totalnumeros desde 0
    
      
 
    compararNegros: ; buscamos los negros(bucle)
        cmp esi, 5   ; comparamos si es ultimo elemmeento del TotalNumeros
        jg salirdeahi    
        mov al, BYTE[TotalCADENAColores + esi]
        cmp BYTE[TotalNumeros + esi], al; comparamos a los negros 
        je incNegros; si son mismos nnumeros incrementamos numero negros
        mov edi, 0;ponemos el index de TotalCADENAColores al 0 por buscar grises
        jmp compararGris;buscamos gris para nuestro numero del TotalNumero en posicion esi

    compararGris:; buscamos gris         
        cmp edi, 5; comparamos si no es ultimo elemento de TotalCADENAColores
        jg incEsi ; si es incrementamos esi y volvemos contar negros
        mov al, BYTE[TotalCADENAColores + edi] 
        cmp BYTE[TotalNumeros + esi], al ;comparamos si es gris 
        je incGris; si es incrementamos numero grises

        inc edi; 
        jmp compararGris; comparamos el siguente (si es gris)

    incNegros:; incrementar numero negros y esi
        mov al, byte[TotalNegros]
        inc al
        mov byte[TotalNegros], al

        cmp al, 6; si todos elementos son negros entonces ganado
        je Ganado

        ;si no i volvemos compara los negros
        inc esi
        jmp compararNegros 

    incGris:; incrementar numero grises y esi
       inc byte[TotalGrises]
       inc esi
       jmp compararNegros

    incEsi:;incermentamos esi
       inc esi
       jmp compararNegros

    salirdeahi:; salimos del bulce
        cmp byte[Color_Fila], 19; comprobamos si es ultima "vida"
        jg Perdido; si es llamamos perdido
        ret


Ganado:; funcion para evento si gugador tiene 6 negras
     mov ecx, posicion_ganado
     mov edx, Lposicion_ganado
     Call Imprimir

     mov ecx, ganado
     mov edx, Lganado
     Call Imprimir

     jmp JugarDeNuevo; preguntamosd si usuario quiere jugar de nuevo
    

Perdido:; funcion para evento si gugador 
     mov ecx, posicion_ganado
     mov edx, Lposicion_ganado
     Call Imprimir

     mov ecx, perdido
     mov edx, Lperdido
     Call Imprimir

     jmp JugarDeNuevo; preguntamos si usurio quiere jugar de nuevo



    

JugarDeNuevo:; pregunta si usurio quiere jugar de nuevo


     mov ecx, posicion_otraj
     mov edx, Lposicion_otraj

     Call Imprimir

     mov ecx, otraj
     mov edx, Lotraj
     Call Imprimir
 
     Call PonerNegrosyGrises	
     Call ColacarFichasColores
     

     Call Normalizar
     mov ecx, posSN
     mov edx, LposSN

     Call Imprimir

    
         
     ;comprobamos las respuestas
     mov ecx, SN
     mov edx, 2
     Call Leer

     cmp byte[SN], "S"
     je Salir

     cmp byte[SN], "s"
     je Salir

     cmp byte[SN], "N"
     je _start

     cmp byte[SN], "n"
     je _start

     jmp JugarDeNuevo
 



Seguir:

	Call Borrar_Pantalla	            ; Borra la Pantalla  - (PREPROGRAMADA)	 
	
	Call Poner_Registros_a_Cero         ; Coloca los registros más utilizados a 0 - (PREPROGRAMADA) 
	
	Call SuperBloque1                   ; Visualiza por Pantalla el contenido del SuperBloque1  - (PREPROGRAMADA) 
	
	Call SuperBloque2                   ; Visualiza por Pantalla el contenido del SuperBloque2  - (PREPROGRAMADA)
    mov byte[Color_Fila], 3	
    bucle:
	    Call PedirCadena

        Call PonerNegrosyGrises	
        Call ColacarFichasColores
       

      

	    Call Normalizar
        jmp bucle


; +++++++++++++++++++++++++ Borrar Pantalla ++++++++++++++++++++++++++++     - (PREPROGRAMADA)	
Borrar_Pantalla:
	mov ecx, ESC_Borrar		; Borramos la Pantalla
	mov edx, L_ESC_Borrar
	Call Imprimir	
	ret
	
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	


; +++++++++++++++++++++ Poner_Registros_a_Cero +++++++++++++++++++++++++  - (PREPROGRAMADA)	
Poner_Registros_a_Cero:
	xor rax, rax    ; rax = 0
	xor rbx, rbx    ; rbx = 0
	xor rcx, rcx    ; rcx = 0
	xor rdx, rdx    ; rdx = 0
	xor rsi, rsi    ; rsi = 0
	xor rdi, rdi    ; rdi = 0
	xor r15, r15    ; r15 = 0
	xor r14, r14    ; r14 = 0
	xor r13, r13    ; r13 = 0
	xor r12, r12    ; r12 = 0
	xor r11, r11    ; r11 = 0
	xor r10, r10    ; r10 = 0
	xor r9, r9      ; r9 = 0
	xor r8, r8      ; r8 = 0
    ret
	
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	


; +++++++++++++++++++++ Imprimir +++++++++++++++++++++++++++++++++++++++  - (PREPROGRAMADA)
Imprimir:
	push rax
	push rbx
	
    mov eax, 4	; Llama al Sistema (sys:write)
    mov ebx, 1	; stdout (La salida va a ser por PANTALLA)
	int 80h     ; Llamamos al Sistema Operativo
	
	pop rbx
	pop rax
	ret
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


; +++++++++++++++++++++++ Leer +++++++++++++++++++++++++++++++++++++++++  - (PREPROGRAMADA)
Leer:
	push rbx
	
    mov eax, 3	; Llama al Sistema (sys:read)
    mov ebx, 0	; stdin (La entrada va a ser por TECLADO)
	int 80h     ; Llamamos al Sistema Operativo
	
	pop rbx
	ret
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	


; *************************** PROCDIMIENTOS A COLOCAR POR EL ALUMNO *********************************************************
;																															*
; 	Aqui puede poner el alumno sus PROCEDIMIENTOS																			*
;																															*																						
; ***************************************************************************************************************************	


; ++++++++++++++ Poner Negros y Grises +++++++++++++++++++++++++++++++++  - (PREPROGRAMADA)
PonerNegrosyGrises:

	mov esi, 0
	
	mov ecx, Negro
	mov edx, LNegro
	Call Imprimir	
		
	mov al, BYTE[Color_Fila]
	
	mov BYTE[X_Fila], al
	
	
Volver_Dibujar_Negros:	
	cmp BYTE[TotalNegros], 0
	
	je Salir_Dibujar_Negros
	
	mov al, BYTE[PosicionesNegrosGrises + esi] 
	
	mov BYTE[Y_Columna], al
			
	Call Colocar_Posicion
	
	Call Poner_Posicion

	mov ecx, CadenaNumero1
	mov edx, LCadenaNumero1
	Call Imprimir    ; Llamamos al Sistema Operativo
	
	dec BYTE[TotalNegros]
	
	inc esi
	
	jmp Volver_Dibujar_Negros
	
Salir_Dibujar_Negros:	
	
	mov ecx, Gris
	mov edx, LGris
	Call Imprimir	

Volver_Dibujar_Grises:	
	cmp BYTE[TotalGrises], 0	
	
	je Salir_Dibujar_Grises	
	
	mov al, BYTE[PosicionesNegrosGrises + esi] 
		
	mov BYTE[Y_Columna], al
			
	Call Colocar_Posicion
	
	Call Poner_Posicion

	mov ecx, CadenaNumero1
	mov edx, LCadenaNumero1
	Call Imprimir    ; Llamamos al Sistema Operativo
	
	dec BYTE[TotalGrises]
	
	inc esi
	
	jmp Volver_Dibujar_Grises	
	
Salir_Dibujar_Grises:	

	ret
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


; +++++++++++++ Colocar Fichas Colores +++++++++++++++++++++++++++++++++  - (PREPROGRAMADA)
ColacarFichasColores:

	mov al, BYTE[Color_Fila]
	
	mov BYTE[X_Fila], al
	
	mov esi, 0

Seguir44:	
	cmp esi, 5
	ja Seguir6
	
	mov al, BYTE[TotalCADENAColores + esi] 
	
	cmp al, "1"
	jne Color2
	
	mov ecx, AzulClaro
	mov edx, LAzulClaro
	Call Imprimir    ; Llamamos al Sistema Operativo	
	jmp Seguir5

Color2:
	cmp al, "2"
	jne Color3
	
	mov ecx, AzulOscuro
	mov edx, LAzulOscuro
	Call Imprimir    ; Llamamos al Sistema Operativo	
	jmp Seguir5	

Color3:
	cmp al, "3"
	jne Color4
	
	mov ecx, Naranja
	mov edx, LNaranja
	Call Imprimir    ; Llamamos al Sistema Operativo	
	jmp Seguir5	

Color4:
	cmp al, "4"
	jne Color5
	
	mov ecx, Rojo
	mov edx, LRojo
	Call Imprimir    ; Llamamos al Sistema Operativo	
	jmp Seguir5	

Color5:
	cmp al, "5"
	jne Color6
	
	mov ecx, Amarillo
	mov edx, LAmarillo
	Call Imprimir    ; Llamamos al Sistema Operativo	
	jmp Seguir5	

Color6:
	cmp al, "6"
	jne Color7
	
	mov ecx, Violeta
	mov edx, LVioleta
	Call Imprimir    ; Llamamos al Sistema Operativo	
	jmp Seguir5	
	
Color7:
	cmp al, "7"
	jne Color8
	
	mov ecx, Verde
	mov edx, LVerde
	Call Imprimir    ; Llamamos al Sistema Operativo	
	jmp Seguir5	
	
Color8:
	cmp al, "8"
	jne Seguir5
	
	mov ecx, Rosa
	mov edx, LRosa
	Call Imprimir    ; Llamamos al Sistema Operativo	

Seguir5:
	
	mov al, BYTE[PosicionesColores + esi]

	mov BYTE[Y_Columna], al
			
	Call Colocar_Posicion
	
	Call Poner_Posicion

	mov ecx, CadenaNumero1
	mov edx, LCadenaNumero1
	Call Imprimir    ; Llamamos al Sistema Operativo
	
	inc esi
	
	jmp Seguir44
	
Seguir6:	

	add BYTE[Color_Fila], 2

	ret
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


; ++++++++++++++++++ Super Bloque 2 ++++++++++++++++++++++++++++++++++++  - (PREPROGRAMADA)
SuperBloque2:

	mov BYTE[Fila], 2
	mov BYTE[Columna], 41
	mov BYTE[N_Filas], 21
	mov BYTE[N_Columnas], 38
	
	Call Montar_Bloque_Blanco
	
	Call Montar_Linea_Roja
	
	Call Normalizar	
	
	ret
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


; ++++++++++++++++++ Super Bloque 1 ++++++++++++++++++++++++++++++++++++  - (PREPROGRAMADA)
SuperBloque1:

	mov BYTE[Fila], 2
	mov BYTE[Columna], 4
	mov BYTE[N_Filas], 6
	mov BYTE[N_Columnas], 34
	
	Call Montar_Bloque_Blanco
	
; **********************************************************************
	
	mov BYTE[X_Fila], 3	
	mov BYTE[Y_Columna], 6
	
	Call Colocar_Posicion
	
	Call Poner_Posicion

	mov ecx, ColorMasterMind
	mov edx, LColorMasterMind
	Call Imprimir    ; Llamamos al Sistema Operativo

	mov ecx, MasterMind
	mov edx, LMasterMind
	Call Imprimir    ; Llamamos al Sistema Operativo	

	Call Normalizar	
	
; **********************************************************************
	
	mov BYTE[Fila], 5 
	mov BYTE[Columna], 6
	mov BYTE[TextoNumero], "1"

	Call VisualizarNumeros
	
; **********************************************************************
	mov BYTE[CadenaNumero + 1], " "
		
; *************************** Azul Claro *******************************

	mov BYTE[X_Fila], 7
	mov BYTE[Y_Columna], 6
	
	Call ColorAzulClaro

; *************************** Azul Oscuro ******************************

	mov BYTE[X_Fila], 7
	mov BYTE[Y_Columna], 10
	
	Call ColorAzulOscuro	

; ***************************** Naranja ********************************

	mov BYTE[X_Fila], 7
	mov BYTE[Y_Columna], 14

	Call ColorNaranja	

; ****************************** Rojo **********************************

	mov BYTE[X_Fila], 7
	mov BYTE[Y_Columna], 18

	Call ColorRojo

; **************************** Amarillo ********************************

	mov BYTE[X_Fila], 7
	mov BYTE[Y_Columna], 22

	Call ColorAmarillo

; **************************** Violeta *********************************

	mov BYTE[X_Fila], 7
	mov BYTE[Y_Columna], 26

	Call ColorVioleta

; ***************************** Verde **********************************

	mov BYTE[X_Fila], 7
	mov BYTE[Y_Columna], 30

	Call ColorVerde

; ****************************** Rosa **********************************

	mov BYTE[X_Fila], 7
	mov BYTE[Y_Columna], 34

	Call ColorRosa

; **********************************************************************
	ret
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


; ++++++++++++++++ Montar Linea Roja +++++++++++++++++++++++++++++++++++  - (PREPROGRAMADA)
Montar_Linea_Roja:

	Call Normalizar	

	mov ecx, Rojo
	mov edx, LRojo
	Call Imprimir    ; Llamamos al Sistema Operativo
	
	mov BYTE[X_Fila], 2	
	mov BYTE[Y_Columna], 60

Volver_Montar_Linea_Roja:	
	cmp BYTE[X_Fila], 23
	ja Salir_Montar_Linea_Roja
	
	Call Colocar_Posicion
	
	Call Poner_Posicion
	
	mov ecx, Barra
	mov edx, 1
	Call Imprimir    ; Llamamos al Sistema Operativo
	
	inc BYTE[X_Fila]
	jmp Volver_Montar_Linea_Roja
	
Salir_Montar_Linea_Roja:
	ret
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


; +++++++++++++++++ Color Azul Claro +++++++++++++++++++++++++++++++++++  - (PREPROGRAMADA)
ColorAzulClaro:

	Call Colocar_Posicion
	
	Call Poner_Posicion	
	
	mov ecx, AzulClaro
	mov edx, LAzulClaro
	Call Imprimir    ; Llamamos al Sistema Operativo	
		
	mov ecx, CadenaNumero
	mov edx, LCadenaNumero
	Call Imprimir    ; Llamamos al Sistema Operativo
	
	Call Normalizar	

	ret
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	


; +++++++++++++++++ Color Azul Oscuro ++++++++++++++++++++++++++++++++++  - (PREPROGRAMADA)
ColorAzulOscuro:

	Call Colocar_Posicion
	
	Call Poner_Posicion	
	
	mov ecx, AzulOscuro
	mov edx, LAzulOscuro
	Call Imprimir    ; Llamamos al Sistema Operativo	
		
	mov ecx, CadenaNumero
	mov edx, LCadenaNumero
	Call Imprimir    ; Llamamos al Sistema Operativo
	
	Call Normalizar	

	ret
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	


; +++++++++++++++++++ Color Naranja ++++++++++++++++++++++++++++++++++++  - (PREPROGRAMADA)
ColorNaranja:

	Call Colocar_Posicion
	
	Call Poner_Posicion	
	
	mov ecx, Naranja
	mov edx, LNaranja
	Call Imprimir    ; Llamamos al Sistema Operativo	
		
	mov ecx, CadenaNumero
	mov edx, LCadenaNumero
	Call Imprimir    ; Llamamos al Sistema Operativo
	
	Call Normalizar	

	ret
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	


; ++++++++++++++++++++ Color Rojo ++++++++++++++++++++++++++++++++++++++  - (PREPROGRAMADA)
ColorRojo:

	Call Colocar_Posicion
	
	Call Poner_Posicion	
	
	mov ecx, Rojo
	mov edx, LRojo
	Call Imprimir    ; Llamamos al Sistema Operativo	
		
	mov ecx, CadenaNumero
	mov edx, LCadenaNumero
	Call Imprimir    ; Llamamos al Sistema Operativo
	
	Call Normalizar	

	ret
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	


; +++++++++++++++++++ Color Amarillo +++++++++++++++++++++++++++++++++++  - (PREPROGRAMADA)
ColorAmarillo:

	Call Colocar_Posicion
	
	Call Poner_Posicion	
	
	mov ecx, Amarillo
	mov edx, LAmarillo
	Call Imprimir    ; Llamamos al Sistema Operativo	
		
	mov ecx, CadenaNumero
	mov edx, LCadenaNumero
	Call Imprimir    ; Llamamos al Sistema Operativo
	
	Call Normalizar	

	ret
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	


; +++++++++++++++++++ Color Violeta ++++++++++++++++++++++++++++++++++++  - (PREPROGRAMADA)
ColorVioleta:

	Call Colocar_Posicion
	
	Call Poner_Posicion	
	
	mov ecx, Violeta
	mov edx, LVioleta
	Call Imprimir    ; Llamamos al Sistema Operativo	
		
	mov ecx, CadenaNumero
	mov edx, LCadenaNumero
	Call Imprimir    ; Llamamos al Sistema Operativo
	
	Call Normalizar	

	ret
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	


; ++++++++++++++++++++ Color Verde +++++++++++++++++++++++++++++++++++++  - (PREPROGRAMADA)
ColorVerde:

	Call Colocar_Posicion
	
	Call Poner_Posicion	
	
	mov ecx, Verde
	mov edx, LVerde
	Call Imprimir    ; Llamamos al Sistema Operativo	
		
	mov ecx, CadenaNumero
	mov edx, LCadenaNumero
	Call Imprimir    ; Llamamos al Sistema Operativo
	
	Call Normalizar	

	ret
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	


; ++++++++++++++++++++ Color Rosa ++++++++++++++++++++++++++++++++++++++  - (PREPROGRAMADA)
ColorRosa:

	Call Colocar_Posicion
	
	Call Poner_Posicion	
	
	mov ecx, Rosa
	mov edx, LRosa
	Call Imprimir    ; Llamamos al Sistema Operativo	
		
	mov ecx, CadenaNumero
	mov edx, LCadenaNumero
	Call Imprimir    ; Llamamos al Sistema Operativo
	
	Call Normalizar	

	ret
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	


; ++++++++++++++++ Visualizar Numeros ++++++++++++++++++++++++++++++++++  - (PREPROGRAMADA)
VisualizarNumeros:

	cmp BYTE[Columna], 34
	ja Salir_VisualizarNumeros
	
	mov al, BYTE[Fila]
	mov BYTE[X_Fila], al
	
	mov al, BYTE[Columna]
	mov BYTE[Y_Columna], al
		
	Call Colocar_Posicion
	
	Call Poner_Posicion	
	
	mov al, BYTE[TextoNumero]
	
	mov BYTE[CadenaNumero + 1], al
	
	mov ecx, CadenaNumero
	mov edx, LCadenaNumero
	Call Imprimir    ; Llamamos al Sistema Operativo
	
	inc BYTE[TextoNumero]
	
	add BYTE[Columna], 4
	
	jmp VisualizarNumeros
	
Salir_VisualizarNumeros:	
	
	ret
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	


; ++++++++++++++++++++++ Pausar ++++++++++++++++++++++++++++++++++++++++  - (PREPROGRAMADA)
Pausar:
	push rcx
	push rdx
	
	mov BYTE[X_Fila], 23	
	mov BYTE[Y_Columna], 0
	
	Call Colocar_Posicion
	
	Call Poner_Posicion	
	
	mov ecx, ENTER_Pausa
	mov edx, 1
	Call Leer    ; Llamamos al Sistema Operativo	
	
	pop rdx
	pop rcx
	ret
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


; +++++++++++++++++++++ Salto Linea ++++++++++++++++++++++++++++++++++++  - (PREPROGRAMADA)
SaltoLinea:
	push rcx
	push rdx
	   		
	mov ecx, Salto_Linea
	mov edx, 2
	Call Imprimir    ; Llamamos al Sistema Operativo
	
	pop rdx
	pop rcx
	ret
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	


; +++++++++++++++++++++ Normalizar +++++++++++++++++++++++++++++++++++++  - (PREPROGRAMADA)
Normalizar:
	push rcx
	push rdx
	   		
	mov ecx, ESC_Normalizar	; NORMALIZAMOS la visualización por pantalla
	mov edx, L_ESC_Normalizar
	Call Imprimir	
	
	pop rdx
	pop rcx
	ret
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	


; +++++++++++++++++++++ Pintar Blanco ++++++++++++++++++++++++++++++++++  - (PREPROGRAMADA)
Pintar_Blanco:
	push rcx
	push rdx
	   			
	mov ecx, Blanco	; Escribimos FONDO Blanco
	mov edx, LBlanco
	Call Imprimir	
	
	pop rdx
	pop rcx
	ret
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	


; ++++++++++++++++++ Poner Posicion ++++++++++++++++++++++++++++++++++++  - (PREPROGRAMADA)
Poner_Posicion:
	push rcx
	push rdx
	   			
	mov ecx, Posicion	
	mov edx, L_Posicion
	Call Imprimir	
	
	pop rdx
	pop rcx
	ret
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	


; +++++++++++++++++++++ Pintar Bloque ++++++++++++++++++++++++++++++++++  - (PREPROGRAMADA)
Pintar_Bloque:
	push rcx
	push rdx
	   			
	Call Poner_Posicion
	
	mov ecx, Bloque	; Escribimos "Bloque"
	mov edx, 1
	Call Imprimir	
	
	pop rdx
	pop rcx
	ret
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	


; ++++++++++++++++++ Colocar Posicion ++++++++++++++++++++++++++++++++++  - (PREPROGRAMADA)
Colocar_Posicion:
	push rax
	push rbx
	   			
	xor ax, ax
	mov bl, 10
	mov al, BYTE[X_Fila]
	div bl
	add al, 48	
	add ah, 48
	mov BYTE[Posicion + 2], al
	mov BYTE[Posicion + 3], ah
		
	xor ax, ax
	mov al, BYTE[Y_Columna]
	div bl
	add al, 48
	add ah, 48

	mov BYTE[Posicion + 5], al
	mov BYTE[Posicion + 6], ah
	
	pop rbx
	pop rax
	ret
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	


; ++++++++++++++ Montar Bloque Blanco ++++++++++++++++++++++++++++++++++  - (PREPROGRAMADA)	
Montar_Bloque_Blanco:
	
	Call Pintar_Blanco
	
	mov sil, 0
	mov al, BYTE[Fila]
	mov BYTE[T_Fila], al 
	
Volver_Filas:	
	cmp sil, BYTE[N_Filas]
	ja Salir_Filas
	
	mov dil, 0
	mov al, BYTE[Columna]
	mov BYTE[T_Columna], al 
	
Volver_Columnas:	
	cmp dil, BYTE[N_Columnas]
	ja Salir_Columnas
	
	
	mov al, BYTE[T_Fila]
	mov BYTE[X_Fila], al

	mov al, BYTE[T_Columna]
	mov BYTE[Y_Columna], al
	
	Call Colocar_Posicion
	
	Call Poner_Posicion
	
	Call Pintar_Bloque
	
	inc dil
	inc BYTE[T_Columna]
	
	jmp Volver_Columnas
	
Salir_Columnas:

	inc sil
	inc BYTE[T_Fila]
	
	jmp Volver_Filas

Salir_Filas:

	ret
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


; +++++++++++++++++++++ Salir ++++++++++++++++++++++++++++++++++++++++++  - (PREPROGRAMADA)	
Salir:	
	mov eax, 1	;Llama a la función exit (sys_exit) 
	mov ebx, 0	; Código de Retorno (0 = Sin errores)
	int 80h     ; Llamamos al Sistema Operativo
	ret
; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++	


		
	
	  
