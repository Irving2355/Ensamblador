section .data
    seed dd 42
    a dd 48271
    m dd 2147483647
    fmt_int db "%d",0
    msg_inf db "Ingrese el limite inferior: ",0
    msg_sup db "Ingrese el limite superior: ",0

section .text
    global aleatorios
    extern printf, scanf

aleatorios:
    push rbx
    push rsi
    sub rsp, 40

    ;pedir inferior
    sub rsp,8
    mov rcx, msg_inf
    call printf

    mov rcx,fmt_int
    lea rdx,[rsp]
    call scanf
    mov ebx,[rsp] ;ebx = limite inferior
    add rsp,8

    ;pedir superior
    sub rsp,8
    mov rcx,msg_sup
    call printf

    mov rcx,fmt_int
    lea rdx,[rsp]
    call scanf
    mov ecx,[rsp] 
    add rsp,8

    ;Algoritmo de lehmer
    mov eax,[rel seed] ;eax=seed=42
    mov esi,[rel a] 
    mul esi ;edx=eax*esi (64 bits)

    mov esi,[rel m]
    div esi ; edx = (a*seed)%m
    mov [rel seed], edx

    ;Esclar el numero
    mov eax,edx 
    mov esi,ecx ;limite superior
    sub esi,ebx 
    inc esi 

    xor edx,edx
    div esi ;edx= edx%esi 
    add edx,ebx ;resultado = inferior + aleatorio
    mov eax,edx 

    add rsp,40
    pop rsi
    pop rbx
    ret 