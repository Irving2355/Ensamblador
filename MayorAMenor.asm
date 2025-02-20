ORG 100h

.MODEL SMALL  

.STACK

.DATA
    msg1 DB "DAME NUMERO 1: $"
    msg2 DB 10,13,"DAME NUMERO 2: $"
    msg3 DB 10,13,"DAME NUMERO 3: $"
    msgOrdenado DB 10,13,"NUMEROS ORDENADOS: $"
    
    numeros DB 3 dup(?) ;VECTOR EN 0

.CODE 

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    CALL LeerNumeros
    CALL OrdenarNumeros
    CALL ImprimirNumeros
    
    .EXIT
MAIN ENDP

LeerNumeros PROC
    mov cx,03h
    
    mov si,0 ;indice para almacenar numeros en la lista
    
    leer_loop:
        cmp cx,03h
        mov dx, offset msg1
        je imprimir_msg 
        
        cmp cx,02h
        mov dx, offset msg2
        je imprimir_msg 
        
        cmp cx,01h
        mov dx, offset msg3
        je imprimir_msg
imprimir_msg:
    mov ah,09h
    int 21h
    
    mov ah,01h
    int 21h
    sub al,30h ;convertir de ascii a decimal
    mov numeros[si],al
    inc si
    
    loop leer_loop
    RET
LeerNumeros ENDP
    
OrdenarNumeros PROC
    mov cx,2 ;numeros de pasadas nesesarias
    ordenar_externo:
        mov si,0 ;indice en 0
        mov bx,2 
    ordenar_interno:
        mov al,numeros[si]
        mov dl,numeros[si+1]
        cmp al,dl 
        JGE no_intercambiar 
        
        ;intercambio
        mov numeros[si],dl
        mov numeros[si+1],al 
        
    no_intercambiar:
        inc si
        dec bx
        JNZ ordenar_interno
        LOOP ordenar_externo
        ret
OrdenarNumeros ENDP
    
    
    