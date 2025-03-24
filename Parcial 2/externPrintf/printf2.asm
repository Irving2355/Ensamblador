section .data
    fmt_equal db "Ambos son iguales %d",10,0
    fmt_greater db "El numero mayor es: %d",10,0
section .text
    global compare_and_print
    extern printf

compare_and_print:
    sub rsp,40

    ; Guarda los argumentos en registros temporales
    mov r8, rcx               ; r8 = a
    mov r9, rdx               ; r9 = b

    cmp rcx,rdx 
    je numero_iguales
    jg a_es_mayor
    jmp b_es_mayor

a_es_mayor:
    mov rcx,fmt_greater
    mov rdx,r8
    call printf
    add rsp,40
    ret 
b_es_mayor:
    ;si b es mayor
    mov rcx,fmt_greater
    mov rdx,r9 
    call printf
    add rsp,40
    ret
numero_iguales:
    mov rcx,fmt_equal
    mov rdx,r8
    call printf
    add rsp,40
    ret 