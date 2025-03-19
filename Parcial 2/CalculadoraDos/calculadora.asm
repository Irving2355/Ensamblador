section .text
    global suma,resta,multiplica,divide

suma:
    addsd xmm0,xmm1
    ret 
resta:
    subsd xmm0,xmm1
    ret
multiplica:
    mulsd xmm0,xmm1
    ret
divide:
    test rdx,rdx 
    jz error
    divsd xmm0,xmm1
    ret
error:
    mov rax,-1 
    ret 