#ifndef ROUTER_IN_H
#define ROUTER_IN_H
#include "router.h"

struct Network* read_topology(const char filename[]);
void read_commands(struct Network* net, const char filename[]);

#endif
