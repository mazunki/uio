#ifndef SERVER_H
#define SERVER_H

#include "rdp.h"
#define SERVER_ID 1000

void start_fsp_server(uint16_t udp_port, char *file_buffer, long file_size, 
						uint32_t number_to_serve, float loss_probability);

char* load_file(size_t file_size, const char *filename); // returns buffer size
size_t get_filesize(const char *filename); // returns buffer size

#endif