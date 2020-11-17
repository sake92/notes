
# Teorija vjerovatnoće

## Osnove
Zamislimo da bacamo novčić u zrak, kladimo se hoće li biti pismo ili glava.  
Koja je "vjerovatnoća" da će biti pismo? 
Nemamo pojma šta će biti, naravno, možemo pogriješiti.
Da li postoji IKAKVA ZAKONITOST, formula po kojoj se rezultati tog eksperimenta ponašaju?

Karl Pearson je bacio 24000 puta novčić, 12012 puta je dobio glavu.
Ako mi bacimo novčić 3 puta, dobićemo ili 3 glave, 3 pisma, 1 glavu i 2 pisma, 1 pismo i 2 glave.
Dakle, tek kada je **broj eksperimenata dovoljno veliki**, možemo nešto tvrditi.

Npr. ovdje bi vjerovatnoća dobijanja glave bila, naravno 1/2 tj. 50%.

### Elementarni događaj
Osnovni pojam u teoriji vjerovatnoće je "elementarni događaj" (mogući ishod).  
Skup svih elementarnih događaja naziva se "skup elementarnih događaja" Q.  
"Slučajni događaj" A je **podskup** skupa Q.

Npr ako bacamo kockicu, imamo elementarne događaje: `Q={"pada 1", "pada 2",...,"pada 6"}`.  
Slučajni događaj "pada paran broj" je skup `A={pada 2, pada 4, pada 6}`.

### Događaj
Događaj Q je neminovan, desiće se 100%, vjerovatnoća mu je 1.  
Prazan skup `{}` je nemoguć, vjerovatnoća mu je 0.

Ako su A1 i A2 događaji onda je i A1 U A2 događaj, kad se realizuje BAR JEDAN od ova dva.

Također, A1 presjek A2 je događaj, kad se realizuju OBA ISTOVREMENO. 
Npr. `A1={pada paran broj}`, `A2={pada > 3}`, bilo bi `{4,6}`.

A1 \ A2 je događaj kada se realizuje A1 ali ne A2.

neg(A) je skup svih događaja koji nisu u A.




---
---
## Vjerovatnoća
P(A) se definiše kao vjerovatnoća realizacije događaja A.  
To je realan broj za koji vrijedi:
- 0 <= P(A) <= 1.
- P({}) = 0
- P(Q)  = 1

Vrijede i sljedeće formule:
- P(A U B) =  P(A) + P(B)        // A ili B, kada su A i B disjunktni
- P(A U B) =  P(A) + P(B) - P(A presjek B)
- P(A presjek B) = P(A) * P(B)   // A i B, kada su A i B disjunktni
- A podskup B   =>  P(A) <= P(B)
- P(neg(A)) = 1 - P(A)

Npr. vjerovatnoća dobijanja broja prilikom bacanja kocke je P(n)=1/6.  
Vjerovatnoća da ćemo dobiti tri šestice zaredom je 1/6* 6 *6 = 1/216.  
Možemo dobiti rezultate Q={111,112,..,116,..,666} a jedini povoljan ishod je 666.  
Pošto je |Q|=6^3 rezultat je 1/6^3 :)



---
---
## Zavisni događaji
Događaji A i B su zavisni ako **vjerovatnoća B zavisi od vjerovatnoće A**.
Vjerovatnoća B pod uslovom da se A realizovao piše se sa P(B|A).  
P(B|A) = P(A presjek B) / P(A)




---
---
## Slučajna promjenjiva
Funkcija X(omega) koja svakom slučajnom događaju dodjeljuje neki realni broj
naziva se **slučajna promjenjiva**.

Npr. ako bacamo 2 novčića, skup ishoda je {PP, PG, GP, GG}.
Ako je slučajna promjenjiva definisana kao broja pisama, imala bi vrijednosti:
X(PP)=2, X(PG)=1, X(GP)=1, X(GG)=0.

### Diskretna slučajna promjenjiva
Kod diskretne slučajne promjenjive skup vrijednosti je konačan ili beskonačno prebrojiv.

Raspodjela vjerovatnoća slučajne promjenjive X je skup parova (x,p):  
(2      1       0       ) // vrijednosti promjenjive  
(1/4    1/2     1/4     ) // vjerovatnoće


