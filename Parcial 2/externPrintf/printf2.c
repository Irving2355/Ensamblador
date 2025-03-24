#include <stdio.h>

extern void compare_and_print(int a,int b);

int main(){
    compare_and_print(10,25);
    compare_and_print(10,10);
    compare_and_print(10,9);
    return 0;
}