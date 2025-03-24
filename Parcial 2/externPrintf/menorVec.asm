section .data
    fmt db "El minimo es: %d",10,0
section .text
    global encontrar_minimo
    extern printf

;rcx=puntero al arreglo(arr)
;rdx=longitud del arreglo
encontrar_minimo:
    ;guardar los registros a usar
    push rbx
    push rsi 
    push rdi 
    push rbp 
    push r12

    ;copiar argumentos en los registros 
    mov rsi,rcx
    mov r12d,edx

    ;inicializamos el minimo 
    mov eax,[rsi] ;eax=arr[0]
    mov edi,1  ;edi = i = 1

    ;bucle para buscar
buscar_loop:
    cmp edi,r12d ;i>=len?
    jge imprimir_minimo

    ;colocamos el arr[i] en ebx
    mov ebx, [rsi + rdi*4] ;cada int = 4 bytes arr[i]

    ;comparamos arr[i] con el minimo
    cmp ebx,eax
    jge siguiente

    mov eax,ebx ;nuevo minimo

siguiente:
    inc edi
    jmp buscar_loop

imprimir_minimo:
    sub rsp,40

    mov rcx,fmt ;coloca el primer argumento de printf
    mov edx,eax ;coloca el segundo 
    call printf

    add rsp,40

    pop r12
    pop rbp
    pop rdi
    pop rsi
    pop rbx
ret