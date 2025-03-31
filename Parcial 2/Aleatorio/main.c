#include <stdio.h>

extern int aleatorios();

int main(){
    printf("Se ejecuta codigo NASM\n\n");
    int valor = aleatorios();
    printf("\n\nRegresamos a C\n");
    printf("\nNumero generado %d\n",valor);
    return 0;
}