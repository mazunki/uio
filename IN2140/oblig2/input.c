#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "output.h"
#include "commands.h"
#include "router.h"

struct Network* read_topology(const char filename[]) {
	/*
	 * Takes a filename, and returns the address of a new Network based on the specification given.
	 */
	struct Router *routers;
	struct Network *network = (struct Network*) malloc(sizeof(struct Network)); // size: 8 + 4 = 12 bytes
	FILE *ptr = fopen(filename, "rb");
	
	uint32_t N = 0; // number of routers, 4 bytes given by specification
	fread(&N, sizeof(N), 1, ptr);
	routers = (struct Router*) malloc(N * sizeof(struct Router)); // size: N * (4 + 1 + 249 + 8*MAX_OUTWARDS + 8*MAX_INWARDS) = N*414 bytes

	network->list = routers;
	network->n = N;
	
	// for each router in file
	for(int i=0; i<N; i++) {
		uint32_t id = 0;
		uint8_t flag = 0;
		uint8_t len_model = 0;
		char model[249];
		memset(&model, '\0', sizeof(model));

		fread(&id, sizeof(uint32_t), 1, ptr);
		fread(&flag, sizeof(uint8_t), 1, ptr);
		fread(&len_model, sizeof(uint8_t), 1, ptr);

		if (VERBOSE) printf("Found a router! Id: %i, flag: %hhu, length: %hhu\n", id, flag, len_model);
		fread(&model, sizeof(char), len_model+1, ptr); // +1 to account for \0 character

		(routers+i)->id = id;
		(routers+i)->flag = flag;
		memset( &((routers+i)->outwards), 0, MAX_OUTWARDS*sizeof(struct Router *)); // prefills with 0
		memset( &((routers+i)->inwards), 0, MAX_INWARDS*sizeof(struct Router *));
		for (int j=0; j<len_model; j++) {
			(routers+i)->model[j] = model[j];
		}
	}
	
	if (VERBOSE) printf("Found %i routers\n", N);
	if (VERBOSE) print_network(network);

	// for each connection in file
	uint32_t links[4]; // 2 for A=>B, 2 for \0\0
	while (fread(&links, sizeof(uint32_t), 2, ptr)) {
		add_connection(network, links[0], links[1]);
	} 

	return network;
}

void read_commands(struct Network* net, const char filename[]) {
	/*
	 * Takes a Network address and a filename, and by reading lines in the given file
	 * it operates on the given network, doing specified commands
	 */
	FILE *ptr = fopen(filename, "r");
	char line[512]; // assuming max length of 512 characters per line

	while (fgets(line, sizeof(line), ptr)) {
		line[strlen(line)-1] = '\0'; // strip newline
		if (VERBOSE) printf("====> Parsing line '%s'\n", line);
		char* words = strtok( line, " " );
		if (VERBOSE) printf("\tFound command '%s'\n", words);
		if (strcmp(words, "print")) {
			words = strtok( NULL, " " );
			if (VERBOSE) print_router(get_router(net, strtol(words, NULL, 10)));
		} else if (strcmp(words, "sett_flagg")) {
			uint32_t id;
			uint8_t flag_pos;
			uint8_t new_value;
			words = strtok( NULL, " " );
			id = strtol( words, NULL, 10 );
			flag_pos = words[0];
			new_value = words[1];
			set_flag(net, id, flag_pos, new_value);
		} else if (strcmp(words, "sett_modell")) {
			uint32_t id;
			words = strtok( NULL, " " );
			id = strtol( words, NULL, 10 );
			words = strtok( NULL, " " );
			set_model(net, id, words);
		} else if (strcmp(words, "legg_til_kobling")) {
			uint32_t start_id;
			uint32_t end_id;
			words = strtok( NULL, " " );
			start_id = strtol( words, NULL, 10 );
			words = strtok( NULL, " " );
			end_id = strtol( words, NULL, 10 );
			add_connection(net, start_id, end_id);
		} else if (strcmp(words, "slett_ruter")) {
			words = strtok( NULL, " " );
			delete_router(net, strtol(words, NULL, 10));
		} else if (strcmp(words, "finnes_rute")) {
			uint32_t start_id;
			uint32_t end_id;
			words = strtok( NULL, " " );
			start_id = strtol( words, NULL, 10 );
			words = strtok( NULL, " " );
			end_id = strtol( words, NULL, 10 );
			if ( exists_path(net, start_id, end_id) ) {
				printf("Found route between #%i => #%i", start_id, end_id);
			} else {
				printf("No route between #%i => #%i", start_id, end_id);
			}
		} else {
			printf("Weird command. '%s'\n", line);
		}
	}
}

