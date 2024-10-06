/**
	RDP := Reliable Datagram Protocol
	Provides Multiplexing and reliability

	Packets are sent each 100 ms, sending each packet in order, 
	waiting for acknowledgment of reception before going to the next packet. 
	If no acknowledgment is received, it sends the same packet again.

	End of transmission is marked by an empty payload on a DATA packet.
*/

#include <stdbool.h>
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <inttypes.h>
#include <arpa/inet.h> 
#include "rdp.h"
#include "send_packet.h"

bool is_valid_flag(Packet_t *packet) {
	switch( (CONN_TYPES) packet->flags) {
		case RDP_REQ:
		case RDP_TERM:
		case RDP_DATA:
		case RDP_ACK:
		case RDP_ACC:
		case RDP_REF:
			return true;
		default:
			return false;
	}
}

char *packet_to_str(Packet_t *p) {
	size_t len=0;
	len = snprintf(NULL, len, "{ flags:0x%02x, pktseq:%u, ackseq:%u, senderid:%i, recvid:%i, meta:%i }", 
								p->flags, p->pktseq, p->ackseq, p->senderid, p->recvid, p->metadata);
	char *packet_str = calloc(1, sizeof(*packet_str)*len + 1);

	snprintf(packet_str, len+1, "{ flags:0x%02x, pktseq:%u, ackseq:%u, senderid:%i, recvid:%i, meta:%i }\n",
								p->flags, p->pktseq, p->ackseq, p->senderid, p->recvid, p->metadata);
	return packet_str;
}

void rdp_request(int sockfd, struct sockaddr_in srv_addr) {
	/* Used by the client to request a new connection to the server */
	Packet_t *new_request = calloc(1, sizeof(*new_request)+sizeof("\0"));
	char srv_addr_string[INET_ADDRSTRLEN];

	new_request->flags = RDP_REQ;
	new_request->pktseq = 0;
	new_request->ackseq = 0;
//	new_request->nop;
	new_request->senderid = 0;
	new_request->recvid = (int32_t) lrand48();
	
	sendto( sockfd,
			(const char*) new_request,
			sizeof(new_request), 
			0,
			(const struct sockaddr *) &srv_addr, 
			(socklen_t) sizeof(srv_addr)
		);
	inet_ntop(AF_INET, &srv_addr.sin_addr, srv_addr_string, sizeof(srv_addr_string));
	char *pack_str = packet_to_str(new_request);
	printf("[RPD/Request] Sent request to server %s:[%u]: %s\n", srv_addr_string, ntohs(srv_addr.sin_port), pack_str);
	free(pack_str);
	free(new_request);

}

Connection_t rdp_accept(int sockfd, int32_t server_id, char *buffer, struct sockaddr_in cli_addr) {
	/*
		Uses socket file descriptor to return an RDP_ACC message to the client
		whenever an incoming RDP_REQ message comes. Return value should be added
		to an array of RDP Connection_t nodes, and be handled by the server.
	*/
	Connection_t new_connection;
	memset(&new_connection, 0, sizeof(new_connection));

	char 				cli_addr_string[INET_ADDRSTRLEN];
	inet_ntop(AF_INET, &(cli_addr.sin_addr), cli_addr_string, sizeof(cli_addr_string));
	//ssize_t len = sizeof(cli_addr);
	
	Packet_t *new_packet;
	new_packet = (Packet_t *) buffer;
	memcpy(new_packet, buffer, strlen(buffer)+1);

	new_packet->flags 		= RDP_ACC;
	// new_packet->pktseq 		= 0;
	// new_packet->ackseq 		= 0;

	new_packet->senderid	= server_id;
	// new_packet->recvid		= 0;
	// new_packet->metadata	= 0;
	
	new_connection.cli_addr = cli_addr;
	new_connection.last 	= new_packet;
	new_connection.senderid = server_id;
	new_connection.recvid = 0;
	new_connection.pktseq = 0;
	new_connection.ackseq = 0;

	send_packet(
		sockfd,
		(const char *) new_packet,
		sizeof(&new_packet),
		MSG_CONFIRM,
		(const struct sockaddr *) &cli_addr,
		(socklen_t) sizeof(cli_addr)
	);

	char *pack_str = packet_to_str(new_packet);
	printf("[RDP/Accept] Accepted client %s:[%u] with %s\n", cli_addr_string, ntohs(cli_addr.sin_port), pack_str);
	free(pack_str);
	return new_connection;
}

int rdp_write(int sockfd, char *file_buffer, long file_size, Connection_t *cli_conn) {
	/*
		Using the socket file descriptor, and assuming a connection has already
		been established between the client's address and the server, the next sequence of
		bytes is sent to the RDP client. 
	*/

	char 				cli_addr_string[INET_ADDRSTRLEN];
	inet_ntop(AF_INET, &(cli_conn->cli_addr.sin_addr), cli_addr_string, sizeof(cli_addr_string));

	Packet_t *new_pack = calloc(1, sizeof(Packet_t) + 1000*sizeof(Packet_t*));
	
	new_pack->flags = RDP_DATA;
	new_pack->pktseq = (cli_conn->pktseq)+1;
	new_pack->ackseq = cli_conn->ackseq;
	new_pack->senderid = cli_conn->senderid;
	new_pack->nop = 0;
	new_pack->recvid = cli_conn->recvid;
	new_pack->metadata = 1000;//sizeof(new_pack);

	cli_conn->pktseq = (cli_conn->pktseq)+1;
	
	/*
		TODO: this is not working for some reason
		First step would be to copy a fixed size file,
		but then we need to chunk it down into pieces separated
		by RDP_DATA, RDP_ACK pairs... maybe using ackseq as an index
		counter for the position in file
	*/
	strncpy( ( char * restrict ) new_pack->payload, (const char * restrict) &file_buffer, 10);//, file_size*sizeof(char)); // must crop into pieces

	send_packet(
		sockfd,
		(const char *) new_pack,
		sizeof(new_pack),
		MSG_CONFIRM,
		(const struct sockaddr *) &(cli_conn->cli_addr),
		(socklen_t) sizeof(cli_conn->cli_addr)
	);

	char *pack_str = packet_to_str(new_pack);
	printf("[RDP/Write] Wrote response message to %s:[%u]: %s\n", cli_addr_string, ntohs(cli_conn->cli_addr.sin_port), pack_str);
	free(pack_str);
	free(new_pack);
	cli_conn->last = new_pack;
	return 0;
}

void rdp_terminate(int sockfd, Connection_t *cli_conn) {
	char cli_addr_string[INET_ADDRSTRLEN];
	inet_ntop(AF_INET, &(cli_conn->cli_addr.sin_addr), cli_addr_string, sizeof(cli_addr_string));

	Packet_t *new_pack = calloc(1, sizeof(Packet_t));
	
	new_pack->flags = RDP_TERM;
	new_pack->pktseq = (cli_conn->pktseq)+1;
	new_pack->ackseq = cli_conn->ackseq;
	new_pack->senderid = cli_conn->senderid;
	new_pack->recvid = cli_conn->recvid;
	new_pack->metadata = 0;

	
	sendto( sockfd,
			(const char*) new_pack,
			sizeof(new_pack), 
			0,
			(const struct sockaddr *) &(cli_conn->cli_addr), 
			(socklen_t) sizeof(cli_conn->cli_addr)
		);

	char *pack_str = packet_to_str(new_pack);
	printf("[RDP/Terminate] Sent termination message to %s:[%u]: %s\n", cli_addr_string, ntohs(cli_conn->cli_addr.sin_port), pack_str);
	free(pack_str);
	free(new_pack);
}