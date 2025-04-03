#include <stdio.h>

extern int contar_mayusculas(const char *cadena);

int main(){
    const char *mensaje = "Hola Mundo! 123 ABC xyz";
    int mayusculas = contar_mayusculas(mensaje);
    printf("La cadena es: %s \n\n",mensaje);
    printf("Numero de letras mayusculas: %d \n\n",mayusculas);
    return 0;
}