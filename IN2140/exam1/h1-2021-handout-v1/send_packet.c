#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <netdb.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/select.h>
#include <time.h>
#include <sys/time.h>
#include <arpa/inet.h>

#include "send_packet.h"

extern double drand48();

/* The default loss probability is 10% */
static float loss_probability = 0.1f;

/* Set the loss probability from your command line at the start
 * of the program. */
void set_loss_probability( float x )
{
    loss_probability = x;

    srand48( time(NULL) );
}

/* send_packet has exactly the same parameter set as the Linux sendto
 * function. However, it drops some of the packets that are intended for
 * sending randomly. */
ssize_t send_packet( int sock, const char* buffer, size_t size, int flags, const struct sockaddr* addr, socklen_t addrlen )
{
    float rnd = drand48();

    if( (buffer[0] & (0x4|0x8)) && /* We drop only data and ACK packets */
	    (rnd < loss_probability) )
    {
        fprintf(stderr, "Randomly dropping a packet\n");
        return size;
    }

    return sendto( sock,
                   buffer,
                   size,
                   flags,
                   addr,
                   addrlen );
}
