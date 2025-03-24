#include <stdio.h>

extern void encontrar_minimo(int *arr,int tam);

int main(){
    int valores[]={42,15,23,4,8};
    int tam = sizeof(valores) / sizeof(valores[0]);

    encontrar_minimo(valores,tam);

    return 0;
}