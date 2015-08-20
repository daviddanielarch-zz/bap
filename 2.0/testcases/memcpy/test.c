#include <stdio.h>

int main(){
    char str[] = "CAFECAFE";
    char buffer[8];
    memcpy(buffer, str, 3);
    printf("%s\n", buffer);
}
