#include <stdio.h>
#include <string.h>
#include "output.h"
#include "router.h"

void print_network(struct Network *net) {
	/* 
	 * Takes a network pointer, and prints routers and connections between them on it
	 */
	for (int i=0; i<net->n; i++) {
		if (&net->list[i]) {
			print_router(&net->list[i]);
			for (int j=0; j<MAX_INWARDS; j++) {
				if ((&net->list[i])->inwards[j] != 0) {
					printf("\t Gets connection from #%i\n", ((&net->list[i])->inwards[j])->id);
				}
			}
			for (int j=0; j<MAX_OUTWARDS; j++) {
				if ((&net->list[i])->outwards[j] != 0) {
					printf("\t Connects to #%i\n", ((&net->list[i])->outwards[j])->id);
				}
			}
		}
	}
}

void print_router(struct Router *r) {
	/*
	 * Dumps info of a router from its adress
	 */
	static char flag_str[8];
	memset(&flag_str, '0', sizeof(flag_str));
	for (int i=0; i<8; i++) {
		flag_str[i] = !!( (r->flag >> 7-i) % 2 ) + '0'; // double inverting to enforce binarism
	}
	printf("Router with id %i, flag %s, and model %s\n", r->id, &flag_str, r->model);
}

void print_to_file(struct Network *net, const char filename[]) {
	/*
	 * Dumps a binary copy of the network from its pointer to a file
	 * Since we didn't save the length of the string, we're typing cursed strings with appeneded \0 bytes to it
	 */
	uint32_t model_len = 249;
	uint32_t ZERO = 0;
	FILE *ptr = fopen(filename, "wb");
	fwrite(&net->n, sizeof(uint32_t), 1, ptr);
	for (int i=0; i<net->n; i++) {
		struct Router *r = &(net->list[i]);
		fwrite(&r->id, sizeof(uint32_t), 1, ptr);
		fwrite(&r->flag, sizeof(uint8_t), 1, ptr);
		fwrite(&model_len, sizeof(uint32_t), 1, ptr);  // this is awful.,..,.,., but POSIX COMPILANT HEYYYY
		fwrite(&r->model, sizeof(char), 249, ptr); // uhhhh,,, okay
		fwrite(&ZERO, sizeof(uint32_t), 1, ptr);
	}
	for (int i=0; i<net->n; i++) {
		struct Router *r = &(net->list[i]);
		for (int j=0; j<MAX_OUTWARDS; j++) {
			if (r->outwards[j]) {
				fwrite(&r->id, sizeof(uint32_t), 1, ptr);
				fwrite(&r->outwards[j], sizeof(uint32_t), 1, ptr);
			}
		}
	}
	fclose(ptr);
}
