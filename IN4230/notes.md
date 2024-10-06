
# IN4230 (hyb IN3230)
[semester page](https://www.uio.no/studier/emner/matnat/ifi/IN3230/h24)

# 2024-08-22 (lecture 
[slides](https://www.uio.no/studier/emner/matnat/ifi/IN3230/h24/kursmateriell/in3230_intro.pdf)

- lectures thursdays 14:15-16:00 (NOT wednesdays)
- sept 11 (group exercises start)

- exam (valued 60%, 4 hour)
- management mandatory assignment
- 2 home exams (valued 40%)

- pensum covered by lectures


# 2024-08-29 (lecture 2)
[slides](https://www.uio.no/studier/emner/matnat/ifi/IN3230/h24/kursmateriell/in3230_arch.pdf)

layer n+1 = (layer n+1 pdu)
layer n = (layer n pdu (layer n sdu))

error correction: involves both detection and correct
this requires knowing start and end of the message. delimiting.

doing checksum per piece instead of the whole communicaiton. this is what a packet is.

mtu = maximum transfer unit (link layer)
split ip packets if they're too big, with a sequence number to reconstruct them

ip packets has a bit to say "don't split pls", which is generally enabled in modern days
ipv6 does not have fragmentation at the link layer level

pmtud = try decreasing mtu packet sizes until you no longer get an error. ipv6 thingie

black hole detection. solved by packetization layer pmtu: increasing sizes instead of decreasing. basically firewalls are haha silly


# 2024-09-05 (lecture 3)
[slides](https://www.uio.no/studier/emner/matnat/ifi/IN3230/h24/kursmateriell/in3230_cc.pdf)

we have queues to handle sudden bursts of much data

knee = the limit of throughput

around 1986 people were upgrading links and it would choke the network, leading to Jacobson' s paper on Congestion Avoidance and Control. core principlie is to reach a stable system, aiming to always have the same amount of packets in the system at every point in time.

flow control: avoid receiver gets overloaded (limited by receiver window == rwnd)
congestion control: avoid network getting overloaded (limited by congestion window == cwnd)

- slow start: send 2 packets every time you receive an ack. it starts at 10 now after an update to tcp. if we don't get ack, we halve the rate. we could also 0.7 or some other sub-1 multiplication.
- congestion avoidance: increase window by +1 every time, and /2 when you reach a congestion (aka no acknowledgement response)

sstresh = slow start treshold. used to be cwdn/2, but is now flightsize/2, mainly to deal with variable transmission rates. flightsize = quantity of packets sent, hm?

nowadays dupACK when you receive multiple of the same seq number. timeout is rarely a thing anymore

## queue
queue size: old thumb rule = bandwidth * delay product, aka how many packets which can be in the air at the same time, effectively doubling the network capacity

we need to keep in mind this depends on which dest we're talking with, so it may be unreasonable large if we pick the furthest dest. usually, the access link is generally the bottleneck. unreasonably large buffers cause buffer bloat

if we notice delay, it probably means we're using the buffer, and thus are approaching congestion. this doesn't work in practice because "evil" tcp still exists, and doesn't know you're being fair.

phase effects may cause some bias towards droping packets from one side, leading to undfairness. using randomization on which pakets we drop may balance this out

# 2024-09-12 (lecture 4)
a benefit of looking at latency as opposed to queues is that the latency will look at the whole queue set across the path

codel: controlled delay
fqcodel: fair-queuing codel. default on most linux distros. hashes ip addresses, ports and payload to identify the message. that's the 5-tuple. each tcp connection gets a queue. we fairly schedule each queue.

ECN (explicit congestion network): setting a bit to tell the receiver the packet was about to be dropped, without actually dropping it. the receiver tells the sender to slow down.
in practice, shit doesn't work because some (but too many!) faulty routers just drop the packet entirely.

TODO: elfOS

webrtc: real time communication in the browser. a combination of standards. IETF RMCAT: congestion control for webrtc. mainly promoted by google (gcc, google congestion control), but also cisco (NADA) and ericsson (SCREAM contended). currently only GCC is used (in chrome, at least)

bbr: looks at how quickly ACKs come back, and assumes that's the throughput we should use. uses phases to saturate the network to measure acceptable throughput. (there was an older idea based on the same concept: tcp westwood)

gridftp: opens 10 tcp connections, runing everyone else

tcp control block (tcb): includes metadata about a tcp connection. stored separately.

sharding: artifically splitting a connection into multiple connection (by modifying the ip address...?)

http/3 is using http over a new protocol (quic)

one of the main benefits of QUIC is that it can reuse the same connection for more requests. if you're transmitting a 64M file, you can easily reuse the same TCP information and SYN-ACK, encryption handshake, ... saving a bunch of time.

multipath tcp (mptcp) allows using various interfaces to use several paths for a connection. to avoid congetsion and remain fair, we treat each of them as ½ tcp.

utility function: willingness to pay for a given product (in function of quantity). in most cases, below some threshold, the network becomes close to useless, and above some value any increase doesn't give any benefit. this makes it hard to make a proper formula for tcp fairness. (is this why some want to split the network into per-service payments?)

scalable tcp = sets recovery time after a packetloss to a fixed time. traditionally, it's super slow at high rates (eg 4:43 hours for 10Gpbs)

bic: "6000 times faster than DSL" lol lmao
cubic: most common in linux nowadays

elfOS: group together into two groups: low-latency and everyone else

tcp over satellite: spoofing ip address to advertise shorter delay

pacing instead of bursting causes less buffer congestion. at high speed this becomes hard due to the resolution of the timer required.

# 2024-09-19 (lecture 5)
[slides](https://www.uio.no/studier/emner/matnat/ifi/IN3230/h24/kursmateriell/in3230_transportlayer.pdf)

layer 4
tpdu = transport packet datagram unit

list of well-known numbers came from DARPA just randomly assigning ports for some presentation and had to do things at the same time.

common terminology:
- datagram: udp (unreliable packet)
- segment: tcp (reliable)

udp = destination, port, checksum, payload. nothing else.

kind of mean the same thing, but used in different contexts

using anything else than tcp/udp doesn't really work because it looks strange, and strange things are spooky poopy (and are thus deleted). this concept is called ossification

sctp = streaming content transfer protocol (mostly used for telephony). if you use it for anything else, you're probably gonna have to implement fallback solutions anyway.

TAPS = implements the protocol at the application layer, and the api handles the fallback for you.


[a1,a2,a3,a4] + [b1,b2,b3,b4] => with tcp multistreams [a1,b1,a2,b2] => [a1,b2,b1,a2]
- headline congestion delay

bytestream abstractions. making app streams identifiable can fix this.
http/3 = quic = can handle this.

quic runs over upd (mostly because it's not ossificated lmao)


**udp**
checksum 0 means no checksum (but it could have meant invalid payload!, which media encoders could have handled just fine)

*udp light* includes udp length which specifies how much of the payload which the checksum includes


**tcp**
[rfc](https://www.rfc-editor.org/rfc/rfc793) mostly a bunch of corner cases lmao

tcp was not made by the military, but it was funded by DARPA (the defense advanced research projects agency), and was made to be stubbornly reliable

finalizing a tcp connection is a four-way handshake:
FIN     =>
        <= FIN-ACK
        ... this side can still send data. half-closed connection. no time limit
        <= FIN
FIN-ACK =>

sctp removed half-closed connection because no application needs this lmfao

RFC793 (tcp) is entirely deprecated (by rfc9293) except by a single case: telnet

the reference implementation (made by freebsd) has an almost 1-to-1 relationship between rfc updates and if-blocks in the code.

ECE = ECN echo
CWR = congestion window reduced (response by receiver to sender about ECN)

ect-0, ect-1 different standards for the CWR/ECE bits.


ACK allows the sender to remove the data from its buffer. middleboxes will be a problem if the destination goes offline, since the middlebox will tell the sender it has been arrived.


ACKs are unreliable because ACK10 means everything up to ACK9 is acknowledged, which may be untrue. we can drop some ACKs without losing any real meaning. when we count ACK as 1,2,3... we really should be counting bytes.

nagle algorithm delays their response to see if there's any more information. avoiding to send tiny packets back, when we could be sending it in bigger batches.

*timeout control*:
- go-back-n : send everything from a given point
- selective repeat: pick and choose what's missing

retransmit timeout (RTO): since losses usually happen during congestion, we should avoid adding more congestion immediately, and wait a bit before we request redelivery. generally, "too short is worse than too long"
- timeout calculated by smooth average (EWMA, exponentially weiged moving average)
- `SRTT := (1-a) SRTT + a * RTT`
- `RTO := min(UBOUND, max(LBOUND, b*SRTT)`

newer algo. 4 is choosen because it seems to work fine. linux does not use this.
```
SRTT = (1-a)*SRTT + a*RTT
d = (1-b)*d + b*[SRTT - RTT]
RTO := SRTT + 4*d
```

some variation of this smoothing is useful. being exact here is not the point.

even if we're conservative with our RTO, there's no guarantee. what happens if we send p1, it times out, we send p1 again after our RTO, and we get ACK1. which one does it refer to? we can't know reliably. this is called retransmission ambiguity. this is why timestamps exist in options field. time synchronization doesn't matter here because destination copies the incoming time from sender.

*dupACK*: after third duplicate ACK (total of first+3 dupes = four), we enter a recovery mode
[check page 20 for algorithm](https://www.uio.no/studier/emner/matnat/ifi/IN3230/h24/kursmateriell/in3230_transportlayer.pdf)

newreno solves  aproblem where ACK 9 will be ignored if you're in recovery mode of dupACK 3. due to timeout, you'd start at ACK1 again, which is silly and dumb since you knew ACK 9 actually got delivered.

*SACK*: selective acknowledgement. receiver keeps a scoreboard to keep track of which seq packets have arrived, and which ones it's missing

eifel algorithm: includes timestamps in the acks, meaning we can check if an ACK is timed out or not

if a sender sends one packet with 1000 payload, a sender can in theory send 1000 acks for each byte it receives, which causes the window to increase by 1000 times too many. (appropriate byte counting fixes this)

proportional rate reduction (rfc6937) solves the issue of half-off and half-off during recovery by pacing out the recovery segment

around 80% of packets are in slow-start mode, and aren't lost. this is why the initial window has been increased. currently 10 by default.

tcp fast open (TFO) allows GET requests on SYN. using a cookie, the server can prove they're the original device. this cookie seems to remain for a long time (matter of days on google)

RTOR aims to fix the issue of delay of a roundtrip not being accounted for when timing out.

RACK (recent acknowledgement) keeps track of when packets were sent, and we assume that packets which were sent close to each other were on a "similar" network. if a packet was sent much earlier and we got no ACK for it, we assume it is lost even if it was "acknowledged".

# 2024-09-26 (lecture 6)
on-chip networks (OCNs), interconnecting different locations on a chip. a few centimeters of distance, often tens/hundreds of nodes.

system/storage area networks (SANs) (sometimes called offline networks). "Frontier", biggest HPE computer atm


credits required on a specific two-device network can be calculated by the follow relationship: `packet + credit delay <= (packetsize/bandwidth) *  credit`

networking: what paths are possible for packets?
routing: which paths are allowable (valid) for packets?
arbitration: when are paths available for packets?
switching: how are paths allocated to packets?

TODO: learn latency calculations

folded clo = folded benes (using 2x2 nodes) = fat (because there's many roots) tree
it provides full bisection, but it's also expensive to make.

the price of switches is cheaper than a fully connected mesh. therefore indirected connections are more popular. that said, some alternatives to direct connections include mesh (bad), torus (wraparound), hypercube (n/2 bisect)

# 2024-10-03 (lecture 7, Özgü)

- 1873: maxwell equations: explained how electromagnetic waves worked over the air
- 1896-ish: we're not sure who got the first patent for radio. aka sending information over the air.

...during world war ish, a few things were invented, but not much wireless specifically:
- broadcasting (television) / unicast (end-to-end)
- encryption

- 1980: commercial wireless network (in the US)
- 1990: 2G GSM, GPRS, EDGE...: more than just voice
- 2000: 3G, bluetooth, wifi... a lot of innovation in wireless connectivity
- 2010: mobile connectivity
- 2020: unicorns will be invented (using 5G)

## wireless considerations
*frequency*:
    - higher frequency => shorter distance, more data
        - higher fire rate gives more opportunity to send data
        - don't pentrate surface very well.
    - lower frequency => longer distance

*interference*:
- from other wireless signals
- from engines

multipath propagation: omnidirectional, reflection of surfaces


frequency spectrum:
..., radio, micro-wave, IR, visible light, UV, xray, cosmic rays
       ^ we are here
            ^ we are moving towards here

## modulation
signal: cosine wave
analogue modulation: boing boing boing (modulate amplitude)
frequency modulation: spring-like squish squish (modulate frequency)

*carrier signal* : anything which can be modulated (amplitude, frequency, phase). can be sinus wave, pulse wave, or something else.

- *ASK* : amplitude shift keying (specific amplitude for each data value, generally low/high == 0/1)
- *FSK* : frequency shift keying (same thing, but low and high frequencies)
- *PSK* : phase shift keying (changing from phase=0 to phase=180, looks like a cut in the function)


constellation diagram: used in phase shifting



qpsk: quadrature phase constellation

binary phase shift keying, better than (ask and bask?)

quadrature amplitude modulation (QAM): combining PSK and ASK to draw dots. using 4 phases and 4 amplitudes we have 16 symbols woooot. kind of a grid

perfect channel: no noise
white noise: circle around the noise
phase jitter: noise on the phase dimension

knowing the environment can help us choose how we want to modulate

noise affects amplitude more than it affects phase.
rapid amplitude change can cause issues with PSK

## multiplexity
- TDMA (time division multiple access): taking turns over time
- FDMA (frequency division multiple access): use a subsection of the frequency domain
    - more complicated and expensive (since it requires filters on input and sum on output)

- CDMA (code devision multiple access):
    - encoder and decoders need to know the code
    - need to pick orthogonal codes

-OFDMA : extension of FDMA, but overlaps frequencies (works thanks to orthogonal principle)

1G/TACS used FDMA
2G/GSM used TDMA
3G used CDMA
4G/LTE, Wimax uses OFDMA

in wireless, losses are quite minimal in practice since loss recovery is quite good, but:
- packet loss/delay to due to bit-errors
- tcp interprets loss as congestion
- capacity of wireless is kinda bad


## MIMO
SISO: single input single output
MISO: double antenna on the device, one receiver. using multiple channels, better reliability

MIMO: two senders and two receivers means i can double the bandwidth or increase reliability through redundancy

STTD: spatial time transmit diversity
SM: spatial multiplexing

## Beamforming
normally, electromagnetic waves are omnidirectional, but through constructive interference we can give it some direction

this allows us reaching further distances too

## mmWave

wifi is 2.4GHz, 5GHz
some antenna are up to 20-30Ghz. we're trying to hit 60GHz. currently 10s of meters is a stretch

`C = B log2(1 + S/N)`
C = channel capacity
B = channel bandwidth
S = signal power
N = average noise, interfrence power


