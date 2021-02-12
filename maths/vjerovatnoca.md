
# Osnove
Zamislimo da bacamo novčić u zrak, kladimo se hoće li biti pismo ili glava.  
Koja je "vjerovatnoća" da će biti pismo? 
Nemamo pojma šta će biti, naravno, možemo pogriješiti.
Da li postoji IKAKVA ZAKONITOST, formula po kojoj se rezultati tog eksperimenta ponašaju?

Karl Pearson je bacio 24000 puta novčić, 12012 puta je dobio glavu.
Ako mi bacimo novčić 3 puta, dobićemo ili 3 glave, 3 pisma, 1 glavu i 2 pisma, 1 pismo i 2 glave.
Dakle, tek kada je **broj eksperimenata dovoljno veliki**, možemo nešto tvrditi.

Npr. ovdje bi vjerovatnoća dobijanja glave bila, naravno 1/2 tj. 50%.

## Elementarni događaj
Osnovni pojam u teoriji vjerovatnoće je "elementarni događaj" (mogući ishod).  
Skup svih elementarnih događaja naziva se "skup elementarnih događaja" Q.  
"Slučajni događaj" A je **podskup** skupa Q.

Npr ako bacamo kockicu, imamo elementarne događaje: `Q={"pada 1", "pada 2",...,"pada 6"}`.  
Slučajni događaj "pada paran broj" je skup `A={pada 2, pada 4, pada 6}`.

## Događaj
Događaj je ustvari SKUP elementarnih događaja!

Događaj Q je neminovan, desiće se 100%, vjerovatnoća mu je 1.  
Prazan skup `{}` je nemoguć, vjerovatnoća mu je 0.

Ako su A1 i A2 događaji onda je i A1 U A2 događaj, kad se realizuje BAR JEDAN od ova dva.

Također, A1 presjek A2 je događaj, kad se realizuju OBA ISTOVREMENO. 
Npr. `A1={pada paran broj}`, `A2={pada > 3}`, bilo bi `{4,6}`.

A1 \ A2 je događaj kada se realizuje A1 ali ne A2.

neg(A) je skup svih događaja koji nisu u A.




---
---
# Vjerovatnoća
P(A) se definiše kao vjerovatnoća realizacije događaja A.  
To je realan broj za koji vrijedi:
- 0 <= P(A) <= 1.
- P({}) = 0
- P(Q)  = 1

## Nezavisni događaji
Nezavisni događaji se:
- **ne mogu desiti istovremeno**, ne preklapaju se
- **ne zavise jedan od drugog**, ne uslovljavaju se

Npr. ako pitamo koja je vjerovatnoća da ćemo baciti kockicu i dobiti 1 ili 4? Ta 2 događaja su potpuno nezavisna, ne mogu se desiti istovremeno.  
Pošto se vjerovatnoća *povećava kada kažemo "ovo ili ovo?"* znači da se sabiraju:
```
P(A U B) =  P(A) + P(B)
```
Za kockice bi bilo 1/6 + 1/6 = 2/6 = 1/3 = 33.3%

---
Kada bi pitali koja je vjerovatnoća da ćemo dobiti **1 pa onda 4**, tada bi se vjerovatnoća drastično smanjila.  
Zaključujemo da se vjerovatnoće ovih **nezavisnih događaja** množe:
```
P(A presjek B) = P(A) * P(B)
```
Te bi ovdje imali 1/6 * 1/6 = 1/36

## Zavisni događaji

Događaji A i B su zavisni ako **vjerovatnoća B zavisi od vjerovatnoće A**.  

Npr. ako tražimo vjerovatnoću dobijanja broja 2 ili parnog broja, ta 2 događaja se **mogu desiti istovremeno**, kad dobijemo 2.  
Taj posebni događaj moramo isključiti, tj. njegovu vjerovatnoću, jer je ona **već  uključena u obe vjerovatnoće**...
```
P(A U B) =  P(A) + P(B) - P(A presjek B)
```
Za naš primjer to je 1/6 pa bi rezultat bio:  
1/6 + 3/6 - 1/6 = 1/2 = 50%

---
Vjerovatnoća B, pod uslovom da se A realizovao, piše se sa P(B|A).  
```
P(A presjek B) = P(A) * P(B|A)
  ili ekvivalentno:
P(A presjek B) = P(B) * P(A|B)
```
Nađimo vjerovatnoću izvlačenja srceta iz špila karata, a zatim 7 pik (bez da vraćamo kartu u špil!).  
Imamo `P(A) = 13/52`, `P(B|A) = 1/51`, pa je rezultat `13/(52*51)`.  
Vidimo da je na vjerovatnoću B uticao događaj A, sada imamo manje karata u špilu!

---
Vrijede i sljedeće formule:
- A podskup B   =>  P(A) <= P(B)
- P(neg(A)) = 1 - P(A)



---
---
# Slučajna promjenjiva
To je u suštini promjenjiva čija vrijednost zavisi od nekog slučajnog događaja.  
Funkcija X(omega) koja svakom slučajnom događaju dodjeljuje neki realni broj
naziva se **slučajna promjenjiva**.

Npr. ako bacamo 2 novčića, skup ishoda je {PP, PG, GG, GP}.
Uzmimo npr. da je slučajna promjenjiva definisana kao **broja pisama**.  
Ovim događajima **proizvoljno dodijelimo brojčane vrijednosti**, samo da bi ih znali razlikovat:  
3-dobijamo dva pisma, 2-dobijamo jedno pismo, 1-dobijamo nula pisama (mora biti pozitivan broj!).

## Slučajna promjenjiva
Može biti diskretna i kontinualna.  
Kod diskretne slučajne promjenjive skup vrijednosti je konačan ili beskonačno prebrojiv (N).  
Kod kontinualne, vrijednosti su opisane neprekidnom funkcijom...

# Raspodjela vjerovatnoće

## Diskretna raspodjela vjerovatnoće
Raspodjela vjerovatnoće slučajne promjenjive X (iz prethodnog primjera) je skup parova (x,p):  
(3      2       1)      // vrijednosti promjenjive  
(0.25    0.5    0.25)   // vjerovatnoće, zbir mora biti 1


### Prosječna vrijednost slučajne promjenjive (očekivana vrijednost)
```
u   = SUMA( x*f ) / N
    = SUMA( (x*f) / N ) 
    = SUMA( x* f/N ) 
    = SUMA( x * P(x) ) // jer je f/N ustvari P(x), vjerovatnoća događaja x
```

Kod nas bi bilo `u = 3*0.25 + 2*0.5 + 1*.25 = 2`.  
Što i ima smisla, prosjek i jest 2. tj. dobijanje jednog pisma!

Ovaj prosjek se još naziva i **očekivana vrijednost**!  
Na en. se kaže "expected value", pa se označava se `E[X]`.  
Ona nam pomaže **pri odlučivanju**, npr. da li se isplati ulaziti u neko ulaganje, s obzirom na dobit/rizik.


### Varijansa

```
sigma^2 = SUMA( x^2 * P(x) ) - u^2
```
Kod nas bi bilo `sigma^2 = 3^2*0.25 + 2^2*0.5 + 1^2*.25 - 2^2 = 0.5`.  

### Standardna devijacija

```
sigma = SQRT( SUMA( x^2 * P(x) ) - u^2 ) 
```
Kod nas bi bilo `sigma = 0.707`. 

### Binomna raspodjela vjerovatnoće

Ovdje se radi o događajima YES/NO, tj. samo **2 moguća ishoda**! Svi događaji moraju biti nezavisni.  
Ako imamo:
- `n` događaja ukupno
- `x` željenih događaja, `x<n` naravno..
- `p` je vjerovatnoća jednog željenog događaja, i uvijek je ista!
- `q` = `NOT(p)`
Računa se preko binomne formule:
```
P(x) = C(n,x) * p^x * q^(n-x)
```

Npr. ako se pitamo koja je vjerovatnoća da dobijemo **tačno 3 petice** iz **10 bacanja kockice**.  
To možemo dobiti ovom formulom.  
`P(3) = C(10,3) * 0.166^3 * 0.833^(10-3) = 0.152`

---
Možemo dobiti i **kumulativnu binomnu vjerovatnoću**.  
Npr. kada pitamo koja je vjerovatnoća da dobijemo **3 petice ili manje** iz **10 bacanja kockice**.  
Logično, samo saberemo vjerovatnoće P(1) + P(2) + P(3)...

Imamo
- prosjek bin. raspodjele: `u = n*p`
- varijansu bin. raspodjele: `sigma^2 = n*p*q`
- std.dev. bin. raspodjele: `sigma = SQRT(n*p*q)`

---

## Kontinualna raspodjela vjerovatnoće
Ovdje više nemamo diskretne vjerovatnoće i događaje...  


## Normalna distribucija
Ovdje možemo iskoristiti ono empirijsko pravilo "68-95-99.7".  
Također, površina ispod te zvonce krive je 1.  
To je u suštini ukupna vjerovatnoća...  
Možemo iskoristiti i z-skor da skontamo koliko je nečega u prvih 95% ili obrnuto itd......



# Mont Hall problem

Do you want 1 random door out of 100 (initial guess) or the **best door** out of 99?  
Said another way, do you want 1 random chance or the best of 99 random chances?

https://betterexplained.com/articles/understanding-the-monty-hall-problem/

---
---
Korisno:

https://www.analyticsvidhya.com/blog/2017/09/6-probability-distributions-data-science/  
https://www.mathsisfun.com/data/index.html





