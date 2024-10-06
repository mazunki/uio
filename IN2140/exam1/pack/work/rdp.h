#ifndef RDP_H
#define RDP_H

#include <stdbool.h>
#include <inttypes.h>
#include <netinet/in.h>

typedef enum {
	RDP_REQ 	= 0x01, // Connection Request
	RDP_TERM 	= 0x02, // Connection Termination
	RDP_DATA 	= 0x04, // Data packet
	RDP_ACK 	= 0x08, // Acknowledgment packet
	RDP_ACC 	= 0x10, // Accept Connection
	RDP_REF 	= 0x20  // Refuse Connection (recvid busy)
} CONN_TYPES;

typedef struct Packet {
	uint8_t flags; // 0, 0, REFUSE, ACCEPT, ACK, DATA, TERM, REQ
	uint8_t pktseq; // Sequence number of packet
	uint8_t ackseq; // Sequence number acknowledged
	uint8_t nop;
	int32_t senderid; // Sender ID in Network Byte Order
	int32_t recvid; // Receiver ID in NBO
	int32_t metadata; // DATA => total packet size; REFUSE => error code
	// 16 bytes until here
	char payload[]; // only if DATA, max 1000
	// 1016 bytes max
} Packet_t;

typedef struct Connection {
	struct sockaddr_in	cli_addr;

	int32_t senderid; // Sender ID in Network Byte Order
	int32_t recvid; // Receiver ID in NBO
	uint8_t pktseq; // Sequence number of packet
	uint8_t ackseq; // Sequence number acknowledged

	Packet_t *last;
} Connection_t;

bool is_valid_flag(Packet_t *packet);

char *packet_to_str(Packet_t *p);

void rdp_request(int sockfd, struct sockaddr_in srv_addr); // creates a new RPD connection on package

Connection_t rdp_accept(int sockfd, int32_t server_id, char *buffer, struct sockaddr_in cli_addr);

int rdp_write(int sockfd, char*file_buffer, long file_size, Connection_t *cli_addr);

void rdp_terminate(int sockfd, Connection_t *cli_conn);

#endif