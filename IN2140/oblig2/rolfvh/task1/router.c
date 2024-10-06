#include <stdio.h> // printf()
#include <stdlib.h> // includes malloc()
#include <stdint.h>  // includes uint32_t and similar
#include <string.h> // includes memset() for null-initing arrays

#include "output.h"
#include "input.h"
#include "router.h"


struct Router* get_router(struct Network *net, unsigned int id) {
	for (int i=0; i<net->n; i++) {
		if (net->list[i].id == id) {
			return &(net->list[i]);
		}
	}
}

void add_connection(struct Network *net, uint32_t start_id, uint32_t end_id) {
		struct Router *a = get_router(net, start_id);
		struct Router *b = get_router(net, end_id);
		if (VERBOSE) {
			printf("Found a relationship!, %i %i\n", start_id, end_id);
			printf("\t"); print_router(a);
			printf("\t"); print_router(b);
		}
		for (int i=0; i<MAX_OUTWARDS; i++) {
			if (a->outwards[i] == 0) { // get first empty port
				a->outwards[i] = b;
				b->inwards[i] = a; // redundant but useful
				break;
			}
		}
}


