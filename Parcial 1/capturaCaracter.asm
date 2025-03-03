ORG 100h

.MODEL SMALL

.STACK

.DATA
    msg1 DB "Ingrese un caracter: $" 
    
    ;10 salto linea
    ;13 retorno de carro
    
    msg2 DB 10,13,"El caracter es: $"
    char DB ?

.CODE

MAIN PROC
    ;CARGAR EL SEGEMENTO DE DATOS
    MOV AX, @DATA
    MOV DS,AX
    
    ;MOSTRAR MENSAJE DE ENTRADA
    MOV AH,09h 
    LEA DX,msg1
    INT 21h
    
    ;LEER EL CARACTER
    MOV AH,01h
    INT 21h
    MOV char,AL
    
    ;MOSTRAR MENSAJE DE SALIDA
    MOV AH,09h
    LEA DX,msg2
    INT 21h
    
    ;IMPRIMIR EL CARACTER DADO
    MOV DL,char
    MOV AH,02h
    INT 21h
    
    ;FINALIZAR
    MOV AH,4Ch
    INT 21h

MAIN ENDP
END MAIN
    
    
    
    
    
    
    
    
    
    
    
    