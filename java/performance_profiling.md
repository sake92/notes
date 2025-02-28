

##JFR

Profiling your Java Application - A Beginner’s Guide : by Victor Rentea
https://www.youtube.com/watch?v=3PWgGzpHykc

java -XX:StartFlightRecording:filename=recording.jfr,settings=profile .\hello.java

Ovo "profile" je XML config fajl "profile.jfc" u "jdk-21.0.1+12\lib\jfr".  
Defaultni settings je "default.jfc" koji se koristi za produkciju, low overehead...

## Heap
Java heap je dio memorije koju JVM koristi za alociranje objekata.  
Koriste se flegovi `-Xmx1g` (maximum 1GB) i `-Xms500m` (start sa 500MB heapom).  

Javin heap se sastoji iz YoungGen i OldGen dijela.  
- Young Gen su noviji objekti.  
- Old Gen su stariji objekti, preživjeli su par GC ciklusa.


### Memory leak
Poželjno je dodati i `-XX:+HeapDumpOnOutOfMemoryError "-XX:HeapDumpPath=C:\heap_dumps"` u produkciji.  
Ovo će inicirati pravljenje **heap dumpa kad se dobije OOM** (ne radi kad baciš OOM ručno, throw OOM().. )

Može se interaktivno napravit sa JConsole, `HotspotMBean -> make dump`  
Za analiziranje mogu se koristiti besplatni [Java VisualVM](https://visualvm.github.io/) ili Eclipse MemoryAnalyzer.

## GC

Kada aplikacija zatraži više alociranje memorije, ako nema dovoljno slobodne, okinuće se GC.  
Ako i nakon GC-anja **nema dovoljno memorije koliko se traži, dobićemo OutOfMemoryError**, OOM.

GC prvo pokušava da oslobodi nekorištenu memoriju iz YoungGen, jer su tu objekti koji su kraćeg vijeka trajanja.  
Ako se ne oslobodi dovoljno memorije iz YoungGen, okinuće se **full GC** tj. kopaće se i po OldGen dijelu heapa.  
Zove se full jer se kopa po cijelom heapu.  
Često okidanje full-gc je **simptom memory leaka**!!!

Može se uključiti **verbose gc** da vidimo detaljnije kako GC radi.

> Zanimljivost: što je veći Java heap, to manje threadova možemo alocirat :D
> Zato što threadovi koriste **native memoriju od OS-a**! A alociranjem Java heapa krademo i od te memorije. :)

















