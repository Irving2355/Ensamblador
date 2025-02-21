section .text
    global suma
suma:
    mov rax, rcx ;primer argumento en cx
    add rax, rdx ;segundo argumento en rdx
    ret