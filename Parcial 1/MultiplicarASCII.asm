ORG 100h
.MODEL SMALL
  
.STACK 100h
  
.DATA 
    msg1 DB "Ingresa un numero de hasta 3 digitos: $"
    msg2 DB 10,13,"El numero por 2 es: $"

.CODE 

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ;MOSTRAR MENSAJE DE ENTRADA
    MOV AH,09h
    LEA DX,msg1
    INT 21h ;INT 3 PAUSA COMPLETAMENTE EL PROGRAMA
    
    XOR BX,BX ;BX= 0 (NUMERO ACUMULADO)
    MOV CX,3                           
    
LEER_DIGITO:
    MOV AH,01h
    INT 21h
    
    CMP AL,13
    JE CALCULAR
    
    SUB AL,'0'
    MOV AH,0 ;AX TENGA EL DIGITO (0-9)
    
    XCHG AX,BX
    MOV DX,10
    MUL DX ;AX = BX*10
    ADD AX,BX ;AX=(BX*10)+NUEVO DIGITO
    XCHG AX,BX
    
    LOOP LEER_DIGITO ;DECREMENTA A CX CX>0 
    
CALCULAR:
    MOV AX,BX
    SHL AX,1 ;AX=AX*2
    MOV [2002h],AX ;guardo el resultado en 2002h
    ;INT 3
           
    MOV AH,09h
    LEA DX,msg2
    INT 21h
    
    CALL PRINT_DEC
    
    MOV AH,4Ch
    INT 21h

MAIN ENDP 

PRINT_DEC PROC
    MOV AX,[2002h]
    
    ;INICIALIZAR REGISTROS
    XOR CX,CX ;CONTADOR DE DIGITOS
    MOV BX,10 ;DIVISOR            
    
    EXTRACT_DIGITS:
        XOR DX,DX 
        DIV BX ;DX=AX/BX AX=COCIENTE Y dX RESIDUO
        PUSH DX ;GUARDA EL RESIDUIO EN LA PILA
        INC CX
        TEST AX,AX ;IF(AX==0)
        JNZ EXTRACT_DIGITS;ELSE LLAMA FUNCION
        
    PRINT_LOOP:
        POP DX
        ADD DL,'0'
        MOV AH,02h ;IMPRIME POR CARACTER
        INT 21h
        LOOP PRINT_LOOP
        
    RET
PRINT_DEC ENDP

END MAIN
    
    
    
    
    
    
    