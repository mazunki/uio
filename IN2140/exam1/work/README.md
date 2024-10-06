
# Home exam IN2140/v21 --- Multiplexing and Loss Recovery
## Task
### RDP
RDP is a protocol which will be running on top of UDP, providing reliability and
multiplexing. This means that we must ensure all packets are delivered; and be able
to talk with multiple clients simultaneously, and independently.

### NewFSP
NewFSP is a protocol which will be running on RDP, where one server will be serving files
to clients which make a request. A normal session follows these steps:
1) A client sends a REQ packet.
2) The server receives the REQ packet, and answers with an ACK packet.
3) The server adds the client to its list of children which it needs to take care of.
4) The server loops over all the connected children.
5) For each children, the next DATA packet is sent (including a chunk of the file to be sent)
6) Each children receives the DATA packet, and answers with an ACK packet.
7) Server will block its work until ACK packet arrives from current child.
8) If server doesn't have any more chunks to send, it sends a TERM packet, and orphans the child.
9) The child saves the chunks to a file locally.
10) The server cleans up once N number of children have been fed.

## Files
The main files for the NewFSP server are client.c and server.c. 
Both these files depend on rdp.c, which defines the protocol which we're using. Some of the functions
are intended to be used by the client, while other functions are intended to be used by the server.

`send_packet.c` is used as a wrapper around sendto, but with the forced catch of unreliability. 
Each file comes with the required header file.

## Makefile

`make all` to create a server and a client
After this you may open a server as:
`./server <port> <inputfile> <total_clients> <loss_probability>`

Open up to `<total_clients>` after this by:
`./client <server_ip> <port> <loss_prob>`

You may run examples of these executions with `make host` for the server, and `make child` for each the clients. Beware that the IP address for the server, configured in the Makefile, may be wrong.
You can run a valgrind check on these example programs with the `tests` and `testc` objects, respetively. Configuration for valgrind is found in the Makefile

### BUGS, TODO
Currently, payload is not actually sent from the server, so all files received by the clients are empty. Check `rdp.c:rdp_write():142` for a better description.

The RDP protocol is not working fully as intended either, as the client id is always set to 0, for some reason I can't explain.

Should consider adding timeouts to both the server and the client, since currently both parties will eventually both ends will reach a dead end if the other side of the tunnel decides to abandon.

There may be some cleanup required on import of libraries.

### Valgrind tests
By running a complete test with the arguments given in Makefile, no leaks are found, and no errors are found. By Interrupting excecution, several pointers are reachable.

