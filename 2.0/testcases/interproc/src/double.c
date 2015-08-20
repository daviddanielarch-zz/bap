#include <stdio.h> 
#include <stdlib.h>

int suma(int a, int b){         
	return a + b; 
}

int main(int argc, char *argv[]) {         
	int num;     
	int result = suma(num,5);         
	int result2 = suma(result,2);         
	return result2; 
} 
