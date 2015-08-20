#include <stdio.h> 
#include <stdlib.h>

int suma(int a, int b){         
	return a + b; 
}

int main(int argc, char *argv[]) {
	int x;        
	int total = 0;
	int i = 0;
	for(i=0;i<2;i++){
		total = total + suma(x,2);
	}
	return total;
}
