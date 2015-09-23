#include <stdio.h>
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>


int main(int argc, char *argv[])
{
	char buffer[6];
	int sock = 0;
	int count = recv(sock, buffer, 6, 0);
	return 0;
}
