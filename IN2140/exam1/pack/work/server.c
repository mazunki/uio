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

#include "server.h"
#include "rdp.h"
#include "send_packet.h"

size_t get_filesize( const char *filename) {
	FILE *fp = fopen(filename, "r");
	long buffer_size = 0;
	if (fp != NULL) {
	    if (fseek(fp, 0L, SEEK_END) == 0) {
	        if ((buffer_size = ftell(fp)) < 0) { // check file size
	        	return -1;
	        };
	   }
	}
	fclose(fp);
	return buffer_size;
}
char* load_file(size_t file_size, const char *filename) {
	FILE *fp = fopen(filename, "r");
    char *buffer = malloc(sizeof(char) * (file_size + 2));
	if (fp != NULL) {
        size_t file_len = fread(buffer, sizeof(char), file_size, fp); // assert copy size
        if ( ferror( fp ) != 0 ) {
            return NULL;
        } else {
            buffer[file_size+1] = '\0'; // append null character in case file doesn't include it already
        }
	}
	fclose(fp);
	return buffer;
}

void start_fsp_server(uint16_t udp_port, char *file_buffer, long file_size, 
						uint32_t number_to_serve, float loss_probability) {

	set_loss_probability(loss_probability);
	Connection_t connections[number_to_serve];
	int served = 0;
	int done = 0;
	memset(connections, 0, number_to_serve*sizeof(Connection_t));

	/*
	 *	Set up server file descriptors so we can read/write through the network interface
	 */ 

	int 				sockfd;
	struct sockaddr_in 	srv_addr, cli_addr;
	char 				buffer[64000];
	char 				cli_addr_string[INET_ADDRSTRLEN];
	memset(buffer, 0, sizeof(*buffer));
	memset(&(cli_addr), 0, sizeof(cli_addr));

	// opening a new IPv4 socket using UDP
	if ((sockfd = socket(AF_INET, SOCK_DGRAM, 0)) < 0) {
		perror("[SERVER] Couldn't open UDP server socket on IPv4");
		exit(1);
	}

	// setting up socket address struct
	srv_addr.sin_family 	 = AF_INET; // IPv4
	srv_addr.sin_port 		 = htons(udp_port);
	srv_addr.sin_addr.s_addr = htonl(INADDR_ANY); 	// pick any available address
	//inet_aton("10.13.37.69", &srv_addr.sin_addr); 		// pick a predefined available address
	memset(&(srv_addr.sin_zero), 0, sizeof(srv_addr.sin_zero)); // required padding to zero

	printf("[Server] Configured on port: %i\n", udp_port);


	// binding socket file descriptor to the address:port
	if ( bind( sockfd, (struct sockaddr *) &srv_addr, sizeof(struct sockaddr) ) == -1 ) {
		perror("[SERVER] Couldn't bind socket to network");
		exit(1);
	}

	/*
	 *	Set up file descriptors for each client
	 */

	fd_set read_fdset;//, write_fdset, error_fdset;
	FD_ZERO(&read_fdset);
	int max_fd = sockfd + 1;

	/* Start listening for incoming connections */
	while(done < number_to_serve) {
		FD_SET(sockfd, &read_fdset);

		int event = select(max_fd, &read_fdset, NULL /*write*/, NULL /*except*/, NULL); // timeout is NULL => forever
		if (event == -1) {
			perror("[SERVER] Error while waiting for connection");
			exit(1);
		}

		ssize_t len = sizeof(cli_addr);
		if (FD_ISSET(sockfd, &read_fdset) && ( served < number_to_serve )) {
			/*
				Handle new incoming UDP connections. All connections here should have a RDP_REQ flag,
				otherwise we should reject it. Incoming RDP_ACK packets should be handled inside
				rdp_write() instead, so we can ignore them here.
			 */
			memset(buffer, 0, sizeof(*buffer));
			recvfrom(
				sockfd, 
				buffer, 
				sizeof(Packet_t), 
				0, 
				(struct sockaddr *) &cli_addr,
				(socklen_t *) &len
			);
			inet_ntop(AF_INET, &(cli_addr.sin_addr), cli_addr_string, sizeof(cli_addr_string));
			char *pack_str = packet_to_str((Packet_t *)buffer);
			printf("[SERVER] Got a message from %s:[%u]: %s\n", cli_addr_string, ntohs(cli_addr.sin_port), pack_str);
			free(pack_str);

			connections[served++] = rdp_accept(sockfd, SERVER_ID, buffer, cli_addr);
			printf("[SERVER] Started: %d, Done: %d\n", served, done);
		}

		/*
			Handle pending RDP connections. At this point, all connections in the connections array
			should have pending payload, since we will remove the client from the list of connections
			once rdp_write() returns 0.
		*/
		for (int i=0; i<number_to_serve; i++) {
			inet_ntop(AF_INET, &(connections[i].cli_addr.sin_addr), cli_addr_string, sizeof(cli_addr_string));

			// zero is never a granted port, meaning that if it's zero, it's because it isn't initialized
			if (ntohs(connections[i].cli_addr.sin_port) != 0) {
				int ret = rdp_write(sockfd, file_buffer, file_size, &connections[i]);
				if (ret == 0) {
					rdp_terminate(sockfd, &connections[i]);
					sleep(0.5);
					printf("[SERVER] Terminating connection with %s:[%u]\n", cli_addr_string, ntohs(cli_addr.sin_port));
					memset(&connections[i], 0, sizeof(Connection_t));
					done++;
					printf("[SERVER] Started: %d, Done: %d\n", served, done);
					//free(&(connections[i]->last));
				}
			}
			//sleep(1);
		}
	// end of UDP while loop
	}
}

int main(int argc, char const *argv[]) {
	setbuf(stdout, NULL); // disable print buffering

	uint16_t udp_port = (uint16_t) strtoul(argv[1], NULL, 10);
	const char *filename = argv[2];
	uint32_t number_to_serve = (uint32_t) strtol(argv[3], NULL, 10);
	float loss = strtof(argv[4], NULL);

	size_t file_size = get_filesize(filename);
	if (file_size < 0) {
		perror("Error reading file");
		exit(1);
	};
	char *file_buffer = load_file(file_size, filename);

	start_fsp_server(udp_port, file_buffer, file_size, number_to_serve, loss);
	free(file_buffer);

	return 0;
}