#ifndef ROUTER_COM_H
#define ROUTER_COM_H
#include <stdint.h>
#include <stdbool.h>  // bool type lol
#include "router.h"

void set_flag(struct Network *net, uint32_t id, uint8_t flag_pos, uint8_t new_value);
void set_model(struct Network *net, uint32_t id, const char new_name[]);
void delete_router(struct Network *net, uint32_t id);
uint8_t exists_path(struct Network *net, uint32_t start_id, uint32_t end_id);


#endif
