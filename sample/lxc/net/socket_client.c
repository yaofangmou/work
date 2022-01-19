#include<stdio.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include <errno.h>
#include<stdlib.h>
#include<unistd.h>
#include<string.h>
#include<netdb.h>
#include<sys/types.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<sys/socket.h>
#include<arpa/inet.h>
#include <time.h>
#include <signal.h>
#include"common.h"

#define exit_err(str) do{perror(str);exit(1);}while(0);
#define PORT 4444
#define BUFFER_SIZE 64

int main(int argc,char *argv[])
{
	struct sockaddr_in server_addr;
	int sockfd = -1;
	int len;
	char buf[BUFFER_SIZE];
	char hostname[32] = {0};
	if (argc != 2) {
		exit_err("Need server ip");
	}

	if (gethostname(hostname, sizeof(hostname))) {
		exit_err("Get host name, failed");
	}

	server_addr.sin_family = AF_INET;
	server_addr.sin_port = htons(PORT);
	server_addr.sin_addr.s_addr = inet_addr(argv[1]);

	if ((sockfd = socket(AF_INET, SOCK_STREAM, 0)) == -1)
		exit_err("Socket error");

	len = sizeof(struct sockaddr);
	if (connect(sockfd, (struct sockaddr *)&server_addr, len) == -1)
		exit_err("Connect error");

	sample_printf("Connect sucess, sending msg...\n");

	snprintf(buf, sizeof(buf), "Hello, This is %s socket client!\n", hostname);
	while (send(sockfd, buf, sizeof(buf), 0)) {
		sleep(1);
		sample_printf("[%s]: Send msg...\n", hostname);
	}

	sample_printf("Sending error, Quit now\n");

	close(sockfd);
	return 0;
}

