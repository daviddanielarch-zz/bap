#include <stdio.h>

int main(){
    char str[] = "CAFECAFE";
    char buffer[8];
    strcpy(buffer, str);
    printf("%s\n", buffer);
}
