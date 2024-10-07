
# IN5020

- pending to know assignments
- if yes:
    - 3 obligs => not graded (but required to pass)
    - coding assignments (in groups 2-3 people)

# 2024-09-02 (lecture 1, didn't attend haha yes)
[slides](https://www.uio.no/studier/emner/matnat/ifi/IN5020/h23/pensumliste/2023-08-21-introtods.pdf)

# 2024-09-02 (lecture 2)
[slides](https://www.uio.no/studier/emner/matnat/ifi/IN5020/h23/pensumliste/2023-08-28-systemmodelsfords.pdf)

# 2024-09-02 (lecture 3)
[slides](https://www.uio.no/studier/emner/matnat/ifi/IN5020/h23/pensumliste/2023-09-04-distributedobjects.pdf)

## RPC vs IPC
RPC supports RMI, which allows for a full object oriented approach by passing methods to the server; whereas IPC does not (directly) support this. this allows the server to, for instance, reading values from the object when passed by reference

# 2024-09-09 (lecture 4)
[slides](https://www.uio.no/studier/emner/matnat/ifi/IN5020/h24/pensumliste/2024-09-09-componentsandws.pdf)

*component*: required methods, provided methods, properties and events
*interface*: used by clients, providing methods, which are implemented by one or another component. the relationship between a component and an interface is a binding, often over the network. this is a fundamental idea of distributed model

combining several components yields a composition, which can be, i.e, method based, event based, ...

*contracts*: set of conditions required on both ends of a binding to fulfill a request

a concern with distributed object RPCs is how tightly coupled it is, requiring you to re-implement the subservices for each new distributed object. could we reuse these api services?

our distributed object really becomes middleware

ejb (enterprise javabeans)
- container-managed: pushing calls to services
- bean-managed: developer takes control of services

<!-- break -->

# 2024-09-16 (lecture 5)

volatile systems:
- failure as expectation, not exception
forms: failure in devices and communication, changes in communication characteristics, dynamic associations

smart spaces
- 

device model 

volatile connectivity

**spontaneous interoperation**:
- spontaneous (not planned)
- devices need to bootstrap itself into the home network
- **boundary principle**: both as association limitations, and for security reasons: constrain the scope

discovery service: lease := register(address, attributes), refresh, deregister(lease)

**interoperation**: pick a protocol for communication

- event-system (publish/subscribe)
- tuple space (r/w to a service space)
- direct association


# 2024-09-23 (lecture 6, roman)

when we design systems we have to live under the assumption that perfect synchronization is impossible

x → y ⇒ C(x) < C(y), but the opposite is not necessarily true (they could be concurrent!)

*vector clocks*, storing tuples for each last-timestamp-known from each process. (0,0,1) is neither bigger nor smaller than (1,0,0), therefore they're concurrent. process n will count its own index when performing a new event

a cut (set of prefixes of all processes) of a history may not be consistent, meaning we're missing things which happened before other-things.

if there's no pointer which leads to a state, it means the event shouldn't exist. this is useful in garbage collectors, for instance.


**linearisation**: any valid extension of the order of events (only really makes sense when there's concurrent, i.e non-related, events)

**properties**: _stable_ (if true once, it must be true forever afterwards), _safety_ (only one process can enter a critical section at once), _liveness_ (true in some state we can reach where it must be true; useful to calculate and thus avoid e.g, starvation)

almost by definition: if system is inconsistent, it includes some event which doesn't include its preceding event.


# 2024-09-30 (lecture 7)
replication provides better reliability thanks to availability, but requires more maintenance (repair, data propagation, seekability)

**types (tiers) of replicas**:
- *permanent* (in the core): e.g CDNs—usually signing a deal with a provider, and letting the third party host the data—
- *server-initiated*: predicting requirements and caching data, perhaps in advance to expected DoS attacks, or because of a release of a new movie
- *client-initiated*: cached on client, e.g cookies
- local cache on client

for performance, we don't need super-reliable caches. they are best-effort. the more, the merrier, but we don't need to rely on them

for availability, we do need to rely on replicas. mostly, caches exist for performance, not for availability (but sometimes these lines are blurred)

propagation may be _push-based_ (replicas send new updates to the rest of replicas) or _pull-based_ (replicas request data from someone else on-demand). a _hybrid_ approach may exist in different ways, e.g the client subscribes to the server for all new updates, or server tells everyone about data invalidation without actually pushing the data to everyone

a _contract_ is a semantic relationship between the client and the server. we expect something to happen eventually, but not necessarily immediately. _ideal consistency_ means the system is indistinguishable from a single-replica system

triangle: consistency, efficiency, simplicity. (pick 2 haha)

_sequential consistency_: for each possible global history, there should be a consistent linearization

proving sequential inconsistency can be done by proving cycles of dependencies between events

_active replication_: making sure all the events happen across all replicas at once (this also exists at the hardware level!)

_passive replication_: isn't deterministic, easier to implement, less network load, and slower recovery. if the main server fails, some updates may be lost.

temperature of replicas:
_cold backup_: only the primary backup is active. only if the backup server fails, the secondary backup kicks in. it has the benefit of being the most resource-light. used for reliability, not for performance

_warm backup_: the primary backup acts as a synchronization device, locking the backups across updates. this is mostly used for recovery, and not really performance. the hotter it is, the quicker the backups catch up with the primary node. with a _hot standby_ backup, the backups are always up to date.

*quorum-based replication*: each piece of data is sent to the majority of backup devices, meaning clients can ask (another) majority of backups for the data. since each data payload follows with a sequence number, we can guarantee we have the latest data.


*view*: epoch of system evolution between two consecutive changes of membership (similar to a barrier of event synchronization, acting like a partial linearization). this is useful since systems are unreliable, and we can't guarantee all processes to be up-and-running all the time.

we require a pair of views (eg p,q,r and q,r) to contain the same sequence/collection of events. at the end of the view-pair, we are required to synchronize the events.

# 2024-10-07 (lecture 8)

there's different communication paradigms, and they're suited for different infrastructures and requirements

- **persistence**: fully persistent, fully transient, intermediate
- **synchronicity**: fully sync, fully async, intermediate (middleware, mitm...)

## paradigms

*RPC*: remote procedure call
*message-oriented*: focus of this lecture
- raw socket
- message-passing interface (mpi)
- message-oriented middleware (mom)
- publish/subscribe (e.g mqtt)
*shared-memory models* are mostly used within data centers, not on the internet


## message-programming interface (MPI)
in high-performance computation you often use scattering to work on data in parallel

addressing is done with logical addressing on nodes. it doesn't deal with failtures, and follows a transient model (not persistent)

## message-oriented middleware (haha MOM)

addressing is performed with logical queue names. data is persistent, and connection between nodes is fully decoupled (i.e nodes don't need to be online simultaneously)

`put(msg, q)` and `get(q)`

MOM is still used

## publish/subscribe
addrsesing is done through content (aka subscriptions)

the broker is responsible of coordinating delivery and deciding on persistence of messages.

it's used in many diverse places


**semantic types**:
- subscription to *topics* can be done hierarchically, e.g you can subscribe to `sports`, or `sports.football`, or even wildcards: `sports.foo*`
- you can also subscribe to specific *types* (as opposed to topic), or both
- we can use event *attributes* (we know which fields events take) to apply filter to events, and subscribe to a subset of constraints on the attribute/event space

## multicast implementations

through unicast: very bad

underlay = network layer
overlay = application layer

*small-world phenomenon*: it turns out that if we graph out all the relationship between nodes in the world, we will have a short path to all destinations (up to ~6 hops in worst case). this was a sociological experiment, but also applies to networking!

this makes overlay implementations of multicast quite effective, but the load won't be balanced evenly, and is vulnerable to failures. this can be improved with other types of overlay (e.g regular hypercube)

overlay-based multicasting are both efficient and can guarantee delivery, but maintenance can quickly be costly

## data gossipping
we can also fix nodes in the same style of epidemic analysis: remove infected (aka failed) nodes

fan-out: how many random nodes we want to send to (aka infect)

push-approach: fast when *few nodes* are infected, wasteful when most nodes are already infected
pull-approach: fast when *most nodes* are infected, wasteful when few nodes are infected
combining both: fast for both, but always very wasteful

ideally, we want a uniform partition (each node's view) of the network.

features: it's very scalable, and reasonably fast (but not fastest!) and robust (but not guaranteed!). it can be used for failure detection, data aggregation (updates, invalidation, ...), process monitoring, 

