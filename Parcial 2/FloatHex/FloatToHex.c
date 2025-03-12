#include <stdio.h>
#include <stdint.h> // uint16_t

extern uint16_t float_to_q8_8(double num);

int main(){
    double input;
    printf("Ingrese un numero con punto decimal (00.00):");
    scanf("%lf", &input);

    uint16_t q8_8_value = float_to_q8_8(input);

    printf("Valor en Q8.8 : 0x%04X\n",q8_8_value);
    return 0;
}