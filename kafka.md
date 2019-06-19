
- topic ~~ queue
- append only, ne može se brisat ručno
- ima TTL

### VAŽNO, al ono baš baš
- svaki consumer može odrediti ODAKLE želi početi/nastaviti ČITANJE, tj offset u datom topicu
- može odradit nešto pa se VRATIT nazad...

- svaki consumer pripada nekoj GRUPI
- kad se publisha neka poruka, SAMO JEDAN CONSUMER IZ GRUPE će primit poruku
- ako su consumeri iz različitih grupa onda će SVI dobit poruku, broadcast

You can think of Kafka as a kind of special purpose distributed filesystem dedicated to high-performance,
  low-latency commit log storage, replication, and propagation.

## PARTICIJE

- TOPICI se mogu razbiti na PARTICIJE, logički
- REDOSLIJED poruka je GARANTOVAN na nivou JEDNE PARTICIJE

BROKER je 1 NODE u klasteru 

PULL-based, korisnik TRAŽI od Kafke poruke !!!!!!!!!!! back pressure i to

Messaging traditionally has two models: queuing and publish-subscribe. 
In a QUEUE, consumers read from a queue, and each record goes to ONE of them; 
in PUBLISH-SUBSCRIBE the record is broadcasted to all consumers. 

Queuing allows you to DIVIDE UP THE PROCESSING OF DATA over multiple consumer instances, 
  which lets you SCALE your processing. 
Kad se podaci pročitaju, NESTAJU, brišu se (transparentni su, "u zraku")...

Publish-subscribe allows you BROADCAST data to multiple processes, but has NO WAY OF SCALING PROCESSING 
   since every message goes to every subscriber.

## Consumer grupe
The CONSUMER GROUP concept in Kafka generalizes these two concepts. 
As with a queue the consumer group allows you to divide up processing 
  over a collection of processes (the members of the consumer group). 
As with publish-subscribe, Kafka allows you to broadcast messages to multiple consumer groups.




### Windows issues
if you get

	/bin/sh: /tmp/download-kafka.sh: not found

it means that `download-kafka.sh` has CR LF (`\r\n`) instead of LF (`\n`)
