org 100h

.DATA
    MSG_DEC DB 0DH,0AH,"Numero decimal: $"
    MSG_BIN DB 0DH,0AH,"Numero binario: $"
    MSG_HEX DB 0DH,0AH,"Numero hexadecimal: $"
    SALTO DB 0DH,0AH
    
    RESULT_BIN DB 17 DUP('?') ;16 BITS + 1 DEL TERMINAL
    RESULT_HEX DB 5 DUP('?')

.CODE 

    MOV DX, OFFSET MSG_DEC
    MOV AH,09H
    INT 21H
    
    MOV AH,01H
    INT 21H
    SUB AL,30H
    MOV BL,AL
    
    MOV AH,01H
    INT 21H
    SUB AL,30H
    MOV BH,AL
    ;BL TIENE EL PRIMER NUMERO
    ;BH TIENE EL SEGUNDO NUMERO
    ;conversion a decimal
    MOV AH,0
    MOV AL,BL
    MOV DL,10
    MUL DL ;AX=AL*DL 
    ADD AL,BH ;AX=(BL*10)+BH
    MOV BX,AX
    
    ;convertir a binario
    MOV DX,OFFSET MSG_BIN
    MOV AH,09H
    INT 21H
    
    MOV CX,16
    MOV AX,BX
    LEA DI,RESULT_BIN
    
    PRINT_BIN:
        ROL AX,1 ;ROTAR A LA IZQUIERDA Y ENVIAR BIT MAS SIGNIFICATIVO A CF 
        MOV BYTE PTR[DI],'0'
        JNC PRINT_ZERO  ;SI NO HAY CARRY
        MOV BYTE PTR[DI],'1'; SI CF=1 CAMBIAR 1
        PRINT_ZERO:
            INC DI
            LOOP PRINT_BIN
        MOV BYTE PTR [RESULT_BIN+16],'$'
        
        MOV DX,OFFSET RESULT_BIN
        MOV AH,09H
        INT 21H
        
        MOV DX,OFFSET SALTO
        MOV AH,09H
        INT 21H 
        
   ;CONVERTIR A HEXADECIMAL
   MOV DX,OFFSET MSG_HEX
   MOV AH,09H
   INT 21H
   
   MOV CX,4
   MOV AX,BX
   LEA DI,RESULT_HEX+3
   
   PRINT_HEX:
        MOV DL,AL
        AND DL,0FH ;ELIMINA LOS 4 BITS MENOS SIGNIFICATIVOS
        ADD DL,'0' ;CONVERTIR A ASCII (0-9)
        CMP DL,'9'
        JBE PRINT_HEX_CHAR
        ADD DL,7 ;CONVERTIR DE 10-15 "A.F"
        
        PRINT_HEX_CHAR:
        MOV BYTE PTR[DI],DL
        DEC DI
        ROR AX,4
        LOOP PRINT_HEX
        
        MOV BYTE PTR[RESULT_HEX+4],'$'
        
        MOV DX,OFFSET RESULT_HEX
        MOV AH,09H
        INT 21H
        
        MOV DX,OFFSET SALTO
        MOV AH,09H
        INT 21H
        
        MOV AH,4CH
        INT 21H
END 
        
        
    
    