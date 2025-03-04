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
    
    MOV AH,0
    MOV AL,BL
    MOV DL,10
    MUL DL ;AX=AL*DL 
    ADD AL,BH ;AX=(BL*10)+BH
    MOV BX,AX
    