.mode small

.stack

.data
    msg db "Hola mundo","$" ;comentario

.code

main PROC
    MOV AX, SEG msg
    MOV DS,AX
    MOV AH,09h
    LEA DX,msg
    INT 21H
    .exit
    main ENDP
END