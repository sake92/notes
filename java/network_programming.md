



Network - collection of computers/devices that can send/receive data from one another (they communicate), more or less in real time.  
Each machine on a network is called a **node**.  
Nodes that are fully functional computers are also called
**hosts**.  
Every network node has a unique **address**. 

On some kinds of networks, nodes also have *text names* that help humans identify them, such as "abc.com".  
These names are bound to exactly one address, that can change!  
One address can have several names and one name can refer to several different addresses. 

A **protocol** is a precise *set of rules* defining how computers communicate: the format of addresses, how data is split into packets, and so on. 

## Layers
Standard TCP/IP model has 4 layers:
- physical layer, wires/wifi/optics
- Internet layer, IP
- transport layer, TCP
- application layer, code/Java

Internet protocol is represented by 2 protocols: IPv4(32bit addresses) and IPv6(128bit addresses).  
It's responsible for connecting heterogenous networks (DSL, wifi, satellite) to each other using homogeneous protocols.

Transport layer is responsible for ensuring that **packets are received in the order*** they were sent and that no data is lost or corrupted.  
There are 2 primary protocols here: TCP (reliable) and UDP (unreliable).

The application layer decides what to do with the data after it’s transferred.  
There are a lot of protocols here: HTTP, FTP, SMTP etc.




## IP addresses

Domain Name System (DNS) translates *hostnames* such as “www.oreilly.com,” into nu‐meric Internet addresses such as 208.201.239.101

Some computers, especially **servers**, have fixed  addresses.  
Others, especially **clients** (on LAN/wifi) receive a different address every time they connect to network, often provided by a DHCP server.

### Special IP addresses
All IPv4 addresses that begin with `10`,
`172.16` through `172.31` and `192.168` are **unassigned**.  
These can only be used in **local networks**, but not on the Internet!

### Localhost address
IPv4 addresses beginning with `127` (most commonly `127.0.0.1`) always mean the **local loopback address**.  
These addresses always point to the local computer, no matter which computer you’re running on.  
In IPv6, `0:0:0:0:0:0:0:1` (a.k.a. `::1`) is the loopback address.   
The hostname for this address is often `localhost`.

### Broadcast addresses
IPv4 address that uses the same number for each of the four bytes (i.e., `255.255.255.255`), is a broadcast address.  
Packets sent to this address are received by all nodes on the local network!


## Ports

Every application (on one computer) that uses network has a unique port.  
That's how applications from other computers "know" which app to contact!  
These are just logical constructs. Each packet contains a port for which it is intended.  
E.g. HTTP protocol apps usually use `port=80`.  
There are ~65000 ports. Port 1-1024 are standard ports.

## NAT
Network Address Translation.  
Since it is not practical to assign a unique address, there's NAT method.  
Your local router gives a **local address** to each device that's connected to it (e.g. 192.168.0.34).  
But when "going out", there's **only one address** that is shown to outside/Internet.  
NAT maps each local address to the public address, and keeps track of packets.  
The public address is usually given by your ISP (Internet provider).  
With IPv6 it could become obsolete, since every device can have a unique address.









