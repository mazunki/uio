#include <stdio.h>
#include <stdlib.h>

#include "output.h"
#include "input.h"
#include "router.h"

int main(int argc, char **argv) {
	/*
	 * Mandatory entry point for the program
	 * Uses two arguments, first is topology filename, second is command filename
	 */
	printf("Using filename %s as datafile\n", argv[1]);
	struct Network *network = read_topology(argv[1]);

	print_network(network);
	if (VERBOSE) printf("\n\n ================================================================================================== \n\n");
	
	read_commands(network, argv[2]);

	if (VERBOSE) printf("\n\n ================================================================================================== \n\n");
	if (VERBOSE) print_network(network);

	print_to_file(network, "new-topology.dat");

	free(network->list); // defined in read_topology @ input.c:16
	free(network); // defined in read_topology @ input.c:11
	printf("\n");
	return 0;
}

