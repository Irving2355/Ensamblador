#include <stdio.h>

extern int suma(int, int);

int main(){
    int resultado= suma(5,3);
    printf("La suma es: %d",resultado);
    return 0;
}