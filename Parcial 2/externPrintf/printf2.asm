section .data
    fmt_equal db "Ambos son iguales %d",10,0
    fmt_greater db "El numero mayor es: %d",10,0
section .text
    global compare_and_print
    extern printf

compare_and_print:
    sub rsp,40

    cmp rcx,rdx 
    je numero_iguales
    jg a_es_mayor
    jl b_es_mayor

b_es_mayor:
    ;si b es mayor
    mov rax,rdx 
    mov rcx,fmt_greater
    call printf
    add rsp,40
    ret
a_es_mayor:
    mov rax,rcx
    mov rcx,fmt_greater
    call printf
    add rsp,40
    ret 
numero_iguales:
    mov rax,rcx
    mov rcx,fmt_equal
    call printf
    add rsp,40
    ret 