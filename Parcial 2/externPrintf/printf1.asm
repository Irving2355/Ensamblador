section .data
    msg db "Hola desde NASM",10,0
section .text
    global print_msg
    extern printf

print_msg:
    sub rsp,40 ;Reservar la pila 
    mov rcx, msg ;guardar un puntero
    call printf
    add rsp,40
    ret