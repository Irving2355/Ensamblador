section .text
    global suma,resta,multiplica,modulo
suma:
    ; primer argumento RCX
    ; segundo argumento RDX
    ; Devuelto en RAX
    mov rax,rcx
    add rax,rdx
    ret
resta:
    mov rax,rcx
    sub rax,rdx
    ret 
multiplica:
    mov rax,rcx
    imul rdx
    ret
modulo:
    cmp rdx,0 ;verificar el divisor 0
    je error
    mov rax,rcx 

    ciclo:
        cmp rax,rdx 
        jb fin

        sub rax,rdx
        jmp ciclo
    fin: 
        ret
    error:
        mov rax,-1
        ret 
