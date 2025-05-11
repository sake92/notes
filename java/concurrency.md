

## Semafor

https://docs.oracle.com/en/java/javase/21/docs/api/java.base/java/util/concurrent/Semaphore.html

Čuva jedan broj "dozvola", threadovi mogu uzeti dozvolu (decrement) ili vratiti dozvolu (increment).

Decrement u javi je `acquire()`, koji blokira thread ako ne dobije dozvolu odmah.
Dozvolu može dobiti samo ako već ima dovoljno dozvola u semaforu, ili čekati dok neki drugi thread *vrati dozvolu* u semafor.

Inkrement je u javi `release()`, koji će *potencijalno odblokirati neki drugi thread* koji čeka na semafor.

Zanimljivo je to što za razliku od monitora (`synchronized`) i `Lock`ova, *neki drugi thread može odblokirati semafor* !!!  
Tj. semafor nema koncept ownershipa. Ovo je zgodno kod rješavanja deadlocka.

## Mutex

Poseban slučaj semafora sa *jednom dozvolom*.















