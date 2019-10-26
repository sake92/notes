
# Apache Storm

Storm is the platform for developing distributed, REAL-TIME, data processing platforms. 
Storm is used to process a **stream of data** and update a variety of databases in real time.
Storm can parallelize an intense query so that you can compute it in real time.

A node represents a **single machine** in your setup that executes Storm applications. 
Storm is linearly scalable, which means that you can double the processing capacity by doubling the nodes.

Units of work are executed by worker processes in a Storm cluster.
When a worker dies, Storm will restart that worker, 
and if the node on which the worker is running dies, Storm will restart that worker on some other node. 

Storm provides strong guarantees that each message entering a Storm process **will be processed at least once**. 
In the event of failures, Storm will **replay** the lost tuples/records.

# Components
A Storm cluster follows a master-slave model,
master and slave processes are coordinated through ZooKeeper.

**Nimbus** node is the master in a Storm cluster. 
Nimbus is stateless and stores all of its data in ZooKeeper.
It is designed to be fail-fast, so when the active Nimbus dies, the passive node will
become an active node, or the down node can be restarted without having any effect on the
tasks already running on the worker nodes.
Tj. deploya se više instanci ali je samo jedna master, ostale čuče i čekaju da upane master, da ga neko zamijeni.

**Supervisor** nodes are the **worker** nodes in a Storm cluster. 
Supervisor daemon is also fail-fast and stores all of its states in ZooKeeper so that it can be restarted without any state loss.
A single supervisor daemon normally **handles multiple worker processes** running on that machine.
Nimbus and supervisor nodes do not communicate directly with each other, but through ZooKeeper. 
As all data is storedin ZooKeeper, both Nimbus and the supervisor daemons can be killed abruptly 
without adversely affecting the cluster.

Nimbus <-> ZooKeeper <-> Supervisor

## Data
The basic unit of data that can be processed by a Storm application is called a tuple. 
Each tuple consists of a predefined list of fields. 

## Topology

Topology is an abstraction that defines the **graph of the computation**. 
You create a Storm topology and deploy it on a Storm cluster to process data.
A topology can be represented by a direct acyclic graph, where each node does some kind
of processing and forwards it to the next node(s) in the flow. 

A stream is an **unbounded sequence of tuples** that can be processed in parallel by Storm.
Each stream in a Storm application is given an ID and the
bolts can produce and consume tuples from these streams on the basis of their ID.

Spout is the **source of tuples** in a Storm topology. It is responsible for
reading or listening to data from an external source, for example, by reading from
a log file or listening for new messages in a queue and publishing them.
Whenever a spout emits a tuple, Storm **tracks all the tuples generated** while processing this tuple, and when the
execution of all the tuples in the graph of this source tuple is complete,
it will **send an acknowledgement back to the spout**.
This tracking happens only if a **message ID was provided** when emitting the tuple. 
If null was used as the message ID, this tracking will not happen.
Ako se desi timeout pozvaće se fail, ali opet samo ako je prisutan messageId.

Bolt is the processing powerhouse of a Storm topology and is responsible for transforming a stream.
A bolt can subscribe to multiple streams of other components, either spouts or other bolts in the topology,
and similarly can emit output to multiple streams. 
If a message ID is associated with a tuple, the execute method must publish an ack or
fail event using OutputCollector for the bolt, or else Storm will
not know whether the tuple was processed successfully.


## Paralelizam
Na supervisor nodovima se izvršavaju tzv. "worker" procesi.
Threadovi unutar workera se zovu "executori". Njihov broj se može mijenjati čak i u runtime (rebalans).
Executori izvršavaju tzv. taskove. Taskovi su ili spout ili bolt.
By default, Storm will run one task per executor if the user does not set the number of tasks at the code level.

Stream grouping in Storm provides complete control over how **partitioning of tuples**
happens among the many tasks of a bolt subscribed to a stream. 

- **Shuffle grouping** distributes tuples in a uniform, **random** way across the tasks. 
- **Field grouping** grupiše na osnovu nekog polja u tuple.
- **All grouping** is a special grouping that does not partition the tuples but replicates them to
all the tasks, that is, **each tuple will be sent to each of the bolt's tasks** for processing.
- **Global grouping** does not partition the stream but sends the complete stream to the bolt's task, the smallest ID ???
- **Direct grouping**, the emitter decides where each tuple will go for processing.
- **Local grouping** is used if the tuple source and target bolt tasks are running in the same worker, 
thus minimizing any network hops, resulting in increased performance.



















