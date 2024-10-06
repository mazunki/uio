CC = gcc
CFLAGS = -g -std=gnu11 -Wall -Wpedantic -Wno-unused -Wno-format-truncation

VALGRIND = valgrind --track-origins=yes --leak-check=full

SERVER_IP="129.240.65.61"
PORT=9997
NSERVE=10
FILENAME="./sample"
LOSS_CHANCE="0.5"

%.o : %.c
	$(CC) -c $(CFLAGS) $< -o $@

all: server client

server: server.o send_packet.o rdp.o
	$(CC) $(CFLAGS) server.o send_packet.o rdp.o -o ./server

client: client.o send_packet.o rdp.o
	$(CC) $(CFLAGS) client.o send_packet.o rdp.o -o ./client

sample:
	echo "hello world" > $(FILENAME)

host: server
	./server $(PORT) $(FILENAME) $(NSERVE) $(LOSS_CHANCE)

tests: server
	$(VALGRIND) ./server $(PORT) $(FILENAME) $(NSERVE) $(LOSS_CHANCE)


child: client
	./client $(SERVER_IP) $(PORT) $(LOSS_CHANCE)

testc: client
	$(VALGRIND) ./client $(SERVER_IP) $(PORT) $(LOSS_CHANCE)

clean:
	rm -f *.o ./server ./client ./kernel-file-*
