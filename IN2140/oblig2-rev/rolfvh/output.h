#ifndef ROUTER_OUT_H
#define ROUTER_OUT_H
#include "router.h"

void print_network(struct Network *net);
void print_router(struct Router *r);
void print_to_file(struct Network *net, const char filename[]);

#endif
