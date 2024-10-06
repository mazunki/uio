
# IN5070 (future of internet protocols)

** 2024-08-22 (lecture 1)

- 11:15-14:00 (normally ~2 hours) @ perl
- exam will be oral (30 minutes of preparation + making notes, 30 minutes oral examination using notes. tell and explain)


# cachecast (aim to remove redundancy)
- need a way to figure out the topology of a network
- route (knowing which table node to use) vs forwarding (knowing where to push the data)

- tcp friendliness (congestion control)

- igmp = group management protocol
- mgbp = border protocol

** 2024-08-29 (lecture 2)

caches need to store data and also manage store memory


- cache replacement strategies
- eviction candidate
- cache policies

place cache nodes at maximum redundancy positions

sender => receiver node (cache) => destination
  CM              CS

cm : cache mamagenemt
cs : cache storage

placing the management at the sender allows control of what datapayloads are popular, and which to keep in storage. this avoids cache misses

cmu : cache management unit
csu : cache store unit
(implemented at the network unit, but not known by the router at the ip layer)

- ingress link
- ? link

- link layer is logical layer

- CMU-CSU pairs are implemented per link, so deployment need not be deployed over the whole network

- ns2 : network simulator

** 2024-09-05 (lecture 3)
[slides](https://www.uio.no/studier/emner/matnat/ifi/IN5070/h24/timeplan/manet-part1.pdf)
manet = mobile adhoc net

- ad-hoc flooding (broadcasting recursively)

- pro-active (expensive, congests network...)
- on-demand (works better on stable networks without much mobility)

p2p "breaks" the standard networking standards, where end nodes act as both a node and as a router

p2p: just an idea, many implementation where peers self-organize, big corpo hates it cuz they can't tap you for money

ad-hoc: uhh uhm

predictability of nodes, it's often called the drunken sailor protocol (pp 24)

## aodv
reactive on-demand
uses the broadcast route request (rreq), yells into the abyss until someone hears 

distance vector principle is when nodes build a topology on their own

AODV is not optimized (but some "forks" of aodv like aodv-lr, aodv-esp, advm, aomdv... are)

build routing table with destinations, next-hop, and hops required. this table is filled with sequential numbers to keep order of topology entries (see page 38 of pdf for more fields)

rreq:
ask for path destination, if found return path, else re-broadcast. 
includes a broadcast id to distinguish loops from lost-route

*optimizations*:
- caching/remembering which nodes know which other nodes
- predicting where the node is moving based on velocity, and only broadcasting in that direction


** 2024-09-12 (lecture 4)
[slides](https://www.uio.no/studier/emner/matnat/ifi/IN5070/h22/timeplan/manet-part2.pdf)

**dynamic source routing (DSR)**: instead of each router making a decision on which outgoing path to take towards destination, this responsibility is delegated to the source node instead. this requires the source node to know the topology ahead of time. if it doesn't, it can send a RREQ (route request).

the path backwards is just the reverse order, but there is no guarantee there is a bidirectional path because of i.e. wireless antenna strength. 

RREP (route reply) messages can be overheard by nearby nodes, allowing other people to learn information indirectly because of promiscuous info. they won't re-broadcast it.

when destination recieves a secondary RREQ from the same source, it will also reply back on the other path, giving S an alternative path.

**location aided routing (LAR)**: combine coordinates and expected zone of the destination to ignore re-broadcasting if we're going in the wrong direction

two approaches:
- lar-1: each node calculates if it is in the request zone
- lar-2: measuring if our distance is shorter than previously


**optimized links-state routing (OLSR)**: periodically floods its own state of links. 
to avoid flooding the network, we select a few nodes to re-broadcast the changes (this selection is called multi-point relay)

a main difference here with the previous points is that there are no RREQs, since we live under the assumption that everyone knows how to reach anyone else at any time.

**multipoint relays**: any 2-hop neighbour must be covered by at least one multipoint relay. when finding a path we already cache previous nodes, so only new 2-hop nodes are considered when pathfinding

we minimize the amount of MPRs to minimze the amount of re-broadcasts

generally, for embedded devices in the wild it's better to have many weak nodes, in order to save battery

*MANET*: multihop, self-organized, low energy
*WSN* (wireless sensor networks): multihop, VERY important to save energy

**clock drift**
in order to solve clock synchronization, we use a listen period of 10⁵ times the expected clock drift. we send a synch messages early in our listening period (but not start), to restart our timers.

for bootstrapping, we have a long ass listen time until we hear a sync message from someone. if it times out, it becomes a synchronizer.

rts: request to send (to circumvent contention of the little time we have on the listening period)
cts: clear to send



** 2024-09-12 (lecture 5)
[slides](https://www.uio.no/studier/emner/matnat/ifi/IN5070/h22/timeplan/delaytolerantnetworking.pdf)
[reference](vahdat&becker, techreport 2000)
[transparencies]: taken from m. ammar (co-next 2005)

delay tolerant networks
networks are intolerant to delays because we use timeouts. engineer task: find the correct timeout value. 
if timeouts are too long, traditional networking methods do not work. e.g days or hours.

**mobility-assisted data delivery**: store-carry-forward. normal routers use store-forward. carry refers to physically moving the device (autonomously).

**internal router architecture**: in => [nic (L2)] => [csu (L3)] => L3 functionality => [router architecture] => [cmu (L3)] => [nic (L2)] => out

SWIM: sensor (wireless?) interconnected (marine?), sensors attached to dolphins, carrying data until they get close to access point, when they're able to dump all the info. meanwhile, they'll share it with other dolphins


*darknet*: carrying data from "city" to "village" through vehicles.
[wLAN] => [wWAN] => [mobile VAN] => [mobile VAN] => ... => [mobile VAN] => [fixed VAN]

*epidemic routing*: 'epidemic' refers to how quickly it spreads. replication goes brr. probabilities go brr. because it makes no assumptions, it's quite robust.

nodes include: message buffer, hash table, summary vector, list of last seen nodes
message buffer includes: unique message id, hop count, ack request

cdf = commodity distribution function

approximate:
10m = bluetooth
50m = wifi
250m = manet (uhh is this correct?)

*message ferrying*: using a scheduled ferry to drop our message. since the ferry doesn't know the destination of D, it may be using a beacon to see if it's around at the expected (or not?) location/time(s?).

four approaches:
- non-proactive
- proactive (we're looking at this one)

node-initiated message ferrying (NIMF):

worker will ask themselves if they should go to the ferry. their transition diagram, ish:
- if they do, they'll do a send/recv exchange.
- if they receive work, they'll go to work. they then go back to being a worker.
- special case: if they're close enough to the ferry, they can "quickly" go to send/recv without interrupting their work.

node trajectory control: minimize message drops and reduce proactive movement. work time percentage threshold AND [???] threshold.

results from *message ferrying* as opposed to *epidemic routing* is similar in results, but the area of *mf* is significantly larger (5km × 5km, as opposed to 1500m × 500m)

performance values, ish =
- ratio of sent ÷ received
- latency/delay
- delivered message per energy unit

what is FIMF?

relevant dimensions to see how these dynamic network perform:
- relative mobility of nodes
- density of nodes

low-mobility, high-density = space paths
low-mobility, low-density = no paths
high mobility = space/time paths
middle mobility, low density = message ferrying (mf) is required here (although can be used anywhere)

simulations done with ns3 = network simulator 3 (supports mobility models). discrete event simulator (async thingies)


** 2024-09-26 (lecture 6)

*NAT*: network address translation
only a single device can use a single port at a time. udp and tcp ports have no correlation, they're different pools altogether.

generally, outgoing port from NAT matches the internal device's port, but if the outgoing port is already busy, it'll just pick a random different ip instead

when using the term _realtime_ we're referring to meeting a deadline

generally, outgoing connections are permitted by firewalls, but inbound ones are often blocked. none of these are universal, but very common.

it's quite common for the firewall and the nat device/application to be one and the same

(exam does not include anything about types of NAT)
_source nat_:
<!--this inside port to that outside port-->

_destination nat_
[outside] addr:port => [inside] addr:port

_masquerade_
used when every host on the inside of a network should be available through NATting.
fake news?: destination + source NAT

(static nat: fixed mapping)

*STUN*: session traversal utilities for NAT. kind of like what's-my-ip for generic NAT protocols. helps figuring out how clients can communicate over the firewall.

for firewall punching to work, you generally have a temporary bootstrapping third-party communication path, by which you establish a "more direct" data connection. devices will open a connection from inside, and the firewall will be open for a while

*ICE*: interactive connectivity establishment. meta protocol to figure out which protocol is best for communication between devices, given e.g. which ones they have available. servers aren't directly involved, but is used between clients

** 2024-10-03 (lecture 7)

- [tc](https://en.wikipedia.org/wiki/Tc_(Linux)): often used in combination with iptables to control priorities
- *netem*: allows more control and nastiness (eg dropping packets, adding delay, reordering...) for certain source ip addresses. great for testing your network to simulate unreliable connectivity

most routers today support application level gateway (ALG, also called application level proxy), which makes them implicitly support FTP

*SIP ALG*: (session initiation protocol, often called session border control) a wrapper for clients on both ends of the network which makes ALG work at the session layer

- H.323: old thingie for telephony across firewalls

voip generally works using SIP, driven by telephony providers

[linux plumbers conference](https://lwn.net/Articles/830436/)
[lpc replacement](https://lwn.net/Articles/815751/)

## IPSEC
*AH* (authentication header): application header includes a checksum of the ip header to avoid tampering

*ESP* (encapsulating security payload): similar to AH, but stores a checksum of the TCP header instead

129.0/8, 240.0/8: university of oslo

pdf page 18, document 63:
- blue: ebtables
- green: iptables

