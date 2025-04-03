section .text
    global contar_mayusculas

contar_mayusculas:
    ;guardar rbx va a ser el puntero principal
    push rbx
    xor rax,rax ;rax=0

    ;copiamos el puntero de la cadena
    ;y lo vamos a extender a 64 bit
    mov rbx,rcx

.next_char:
    movzx rdx, byte[rbx] ;rdx=siguiente caracter

    ;si el caracter es 0
    test rdx,rdx ;es catracter nulo?
    jz .fin

    ;comparar el caracter si esta entre A y Z
    ;(65,90)
    cmp dl,'A' ;caracter<'A'?
    jl .siguiente

    cmp dl,'Z' ;caracter > 'Z'?
    jg .siguiente

    inc rax 
.siguiente:
    inc rbx 
    jmp .next_char
.fin:
    pop rbx
    ret 