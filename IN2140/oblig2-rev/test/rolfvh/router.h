#ifndef ROUTER_H
#define ROUTER_H

#include <stdint.h>

#define MAX_OUTWARDS 10
#define MAX_INWARDS 10 
#define VERBOSE 0 

struct Router;
struct Network;

struct Router* get_router(struct Network *net, uint32_t id);
void add_connection(struct Network *net, uint32_t start_id, uint32_t end_id);

struct Network {
	struct Router *list;
	unsigned int n;
};

struct Router {
	uint32_t id; // 4 bytes, unique
	uint8_t flag; // 1 byte: [ change-number[7:4], not used, 5GHZ, Wireless, Active ]
	char model[249]; // max 249 bytes, ends with \0

	struct Router *outwards[MAX_OUTWARDS];
	struct Router *inwards[MAX_INWARDS];
};


#endif
