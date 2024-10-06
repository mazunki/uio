#include <stdio.h> 
#include <stdlib.h> 
#include <inttypes.h>
#include <errno.h> 
#include <string.h> 
#include <netinet/in.h> 
#include <arpa/inet.h> 
#include <sys/socket.h> 
#include <sys/wait.h>
#include <sys/types.h> 

#include "client.h"
#include "rdp.h"
#include "send_packet.h"

void start_fsp_client(const char *ip_addr, uint16_t udp_port, float loss) {
	set_loss_probability(loss);

	int 				sockfd;
	struct sockaddr_in 	srv_addr, my_addr;
	char 				buffer[64000];
	char 				srv_addr_string[INET_ADDRSTRLEN];
	memset(buffer, 0, sizeof(*buffer));

	// opening a new IPv4 socket using UDP
	if ((sockfd = socket(AF_INET, SOCK_DGRAM, 0)) < 0) {
		perror("Couldn't open UDP server socket on IPv4");
		exit(1);
	}

	// setting up server address struct
	srv_addr.sin_family 	 = AF_INET; 
	srv_addr.sin_port 		 = htons(udp_port); 
	inet_aton(ip_addr, &srv_addr.sin_addr); 
	memset(&(srv_addr.sin_zero), 0, sizeof(srv_addr.sin_zero)); // required padding to zero

	// first message to server
	rdp_request(sockfd, srv_addr);
	ssize_t len = sizeof(srv_addr);

	Packet_t * incoming;// = calloc(1, sizeof(incoming) + 1000*sizeof(char));
	char filename_out[32];
	sprintf(filename_out, "kernel-file-%u", (uint16_t) rand());
	FILE *fp = fopen(filename_out, "a");
	do {
		memset(&buffer, 0, sizeof(buffer));

		recvfrom(
			sockfd,
			buffer,
			sizeof(buffer),
			0,
			(struct sockaddr *) &srv_addr,
			(socklen_t *) &len
		);
		incoming = (Packet_t *) buffer;

		/* following packages */
		inet_ntop(AF_INET, &(srv_addr.sin_addr), srv_addr_string, sizeof(srv_addr_string));
		char *pack_str = packet_to_str(incoming);
		printf("[CLIENT] Got a message from %s:[%u]: %s\n", srv_addr_string, ntohs(srv_addr.sin_port), pack_str);
		printf("Payload: %s\n", incoming->payload);

		if (incoming->flags == RDP_TERM) {
			free(pack_str);
			break;
		}

		fprintf(fp, incoming->payload);

		incoming->flags = RDP_ACK;
		incoming->pktseq = (incoming->pktseq)+1;
		incoming->ackseq = (incoming->ackseq)+1;

		send_packet(
			sockfd,
			(const char *) incoming,
			sizeof(&incoming),
			0,
			(const struct sockaddr *) &srv_addr,
			(socklen_t) sizeof(srv_addr.sin_addr)
		);
		sleep(1);

		free(pack_str);
	} while (incoming->flags != RDP_TERM );

	fclose(fp);

	/* finalized */

	close(sockfd);
}

int main(int argc, char const *argv[]) {
	setbuf(stdout, NULL); // disable print buffering

	const char *ip_addr = argv[1];
	uint16_t udp_port = (uint16_t) strtoul(argv[2], NULL, 10);
	float loss = strtof(argv[3], NULL);

	start_fsp_client(ip_addr, udp_port, loss);

	return 0;
}