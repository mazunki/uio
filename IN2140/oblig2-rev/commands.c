#include <string.h>
#include <stdlib.h>

#include "commands.h"
#include "router.h"

void set_flag(struct Network *net, uint32_t id, uint8_t flag_pos, uint8_t new_value) {
	/* 
	 * Looks in network for a router with given id. Then replaces the bit position with new value
	 */
	if (flag_pos == 0 || flag_pos == 1 || flag_pos == 2) {
		if (new_value == 1) {
			get_router(net, id)->flag |= 0x01 << flag_pos;
		} else if (new_value == 0) {
			get_router(net, id)->flag &= ~(0x01 << flag_pos);
		} else {
			// error
		}
	} else {
		get_router(net, id)->flag &= 0x0F;
		get_router(net, id)->flag |= (new_value << 4) + 0xF;
	}
}

void set_model(struct Network *net, uint32_t id, const char new_name[]) {
	/* Looks in network for a router with given id, and updates its model name */
	strcpy((get_router(net, id)->model), new_name); // cheating much?
}

void delete_router(struct Network *net, uint32_t id) {
	/*
	 * Looks in network for router with given id, and deletes it from
	 * its entries. Also updates incoming connections, so they can forget
	 * about it.
	 */
	int i=0;
	for (i=0; i<net->n; i++) {
		if (net->list[i].id == id) {
			break;
		}
	}
	for (int n=0; i<MAX_INWARDS; i++) {
		if ((net->list[i]).inwards[n] != 0) {
			for (int j=0; j<MAX_OUTWARDS; j++) {
				if (((net->list[i]).inwards[n])->outwards[j] == &(net->list[n])) {
					((net->list[i]).inwards[n])->outwards[j] = 0;
				}
			}
		}
	}

	//free(&(net->list[i])); // we can't delete individual routers since we malloc'd the entire array at once

	// move all pointers to fill gap
	for (i=i; i<(net->n)-1; i++) {
		net->list[i] = net->list[i+1];
	}
	// and "remove" last slot
	net->n = net->n - 1;
}

uint8_t exists_path(struct Network *net, uint32_t start_id, uint32_t end_id) {
	/*
	 * Given a network, looks if there is some path between a given id and another id
	 */

	// recursive dfs with fixed size arrays, assuming end of array at 0 value indexes
	for (int i=0; i<MAX_OUTWARDS; i++) {
		if ( (get_router(net, start_id)->outwards[i])->id == end_id ) {
			return 1;
		} else if (get_router(net, start_id)->outwards[i] == 0) {
			return 0;
		} else if ( exists_path(net, (get_router(net, start_id)->outwards[i])->id, end_id) ) {
			return 1;
		}
	}
	return 0;
}

