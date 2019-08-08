
# Automati, "mašine stanja"

Automati (en. state machines) predstavljaju apstraktni model nekog procesa 
koji se sastoji iz više koraka.  
Pošto i kompjuterski programi sami po sebi prelaze iz stanja u stanje,
automati su vrlo korisni u komp. nauci i programiranju.

Automati obično imaju neka svojstva koja se ne mijenjaju pri prelazu iz stanja u stanje.  
Ta svojstva se nazivaju **invarijante**.  
Dokazuju se indukcijom, naravno.

Pomoću njih možemo dokazati da neka stanja **nisu dostižna**.

Automat je, također, binarna relacija nad skupom stanja.
Naziva se još i "relacija prelaza stanja".  
Strelica iz stanja u stanje naziva se tranzicija/prelaz, `q -> r` (iz q u r).  
Ova relacija naziva se još i grafom stanja.
Početno stanje, iz kog polazi da "radi" automat se označava duplom ivicom.


### Primjer: dijagonalno-krećući robot

Recimo da imamo robota koji se kreće dijagonalno po polju `n*n`.
Pretpostavimo da robot kreće iz stanja `(0,0)`.  
Da li robot ikad može doći u polje `(0,1)`?

Odgovor je NE, ali kako da to dokažemo?  
Ispitaćemo sve moguće prelaze stanja.  
Iz stanja `(a,b)` robot može preći samo u sljedeća 4:
- (a+1, b+1)
- (a-1, b-1)
- (a+1, b-1)
- (a-1, b+1)

Dakle, parnost zbira se nikad ne mijenja!!! To je **invarijanta** koju ćemo iskoristiti.  
Npr ako krećemo iz (3,5), zbir je 8. Svako iduće polje ima paran zbir koordinata: (4,6), (2,4), (4,4), (2,6).  

Isto vrijedi i za naše pitanje, robot nikad ne može stići u polje čiji je zbir koordinata neparan! :)  
Isti je fazon i sa lovcem u šahu, može se kretati samo po poljima iste boje: bijelim ILI crnim! ;)
