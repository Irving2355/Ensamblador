section .text
    global float_to_q8_8

; float_to_q8_8 convierte flotante a Q8.8
; Entrada: xmm0: contiene el numero en punto flotante double
; Salida: RAX contien el numero convertido en formato Q8.8

float_to_q8_8:
    cvttsd2si rax,xmm0 ;convertir el valor en xmm0 a entero
    shl rax,8 ; multiplica por 256

    cvtsi2sd xmm1,rax ;convierte la parte entera de vuelta a float
    subsd xmm0,xmm1 ;xmm0=num_original-parte entera 
    
    mov rdx, 256
    cvtsi2sd xmm2,rdx ;convertir 256 a float en xmm2
    mulsd xmm0,xmm2 

    cvttsd2si rdx,xmm0 ;convertir el resultado de la mul a int
    and rdx,0xFF ;limitar a 8 bits (0-255) 
    
    ;rax parte entera
    ;rdx parte fraccionaria

    or rax,rdx ;une y da el formato Q8.8

    ret 