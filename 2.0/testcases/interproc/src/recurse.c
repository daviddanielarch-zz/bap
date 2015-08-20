#include <stdio.h> 
#include <stdlib.h>

int suma(int a){         
	if (a==0){ 
		return 0;
	}
	else{
		return a + suma(a-1);
	}
}

int main(int argc, char *argv[]) {         
	int num;
	num = suma(4);
	return num;
} 
