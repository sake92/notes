
# Dokazi
Matematički dokaz je logičko-matematički **postupak** kojim se s pomoću aksioma i ranije dokazanih teorema potvrđuje neki iskaz/teorem.  

Dakle, dokazivanje pretpostavke/teoreme:  
`aksiom1, aksiom2.. -> lema -> teorema`  
pa zaključujemo da je teorema tačna.

**Aksiomi** se **ne dokazuju** već uzimaju kao već istiniti, polazna tačka.  
**Lema** je kao pomoćna teorema, "usputna".  
**Teorema** je neka važna matematička istina.  
**Korolar** je iskaz koji slijedi iz teoreme, posljedica kao.

## Iskazi
Iskaz (izjava, propozicija) je **izjavna rečenica** koja je ili ISTINA ili LAŽ, nikad oboje/dvosmislena.  
Ostale vrste rečenica: upitne (one sa upitnikom na kraju) i usklične/uzvične (sa uzvičnikom na kraju), ne mogu biti iskazi.

Kod logičkog zaključivanja, ako znamo da je P=true i P->Q zaključujemo da je i Q=true. Ovo se rekne "modus ponens".  
> Npr. ako kiša pada onda je mokar asfalt (P=>Q).  
> Recimo da danas pada kiša (P=true), dakle i Q=true, asfalt je mokar, niđe veze.

Vrste templejta za dokaze:
1. direktno dokazivanje implikacije:    ´P -> Q´
2. dokazivanje kontrapozicije:          ´not Q -> not P´
3. dokazivanje akko:                    ´P <-> Q´ tj. ´(P -> Q && Q -> P)´
4. dokazivanje niza akko: npr. kad imamo beskonačnu sumu i sl.
5. dokazivanje po slučajevima: rastavimo na više jednostavnijih slučajeva
6. dokazivanje kontradikcijom: pretpostavimo da nije P. Ako dobijemo neku nelogičnost, znači da suprotno važi: P.
  Ovo se još zove i "indirektni dokaz".


kontrapozicija, ima istu vrijednost kao implikacija :)
https://en.wikipedia.org/wiki/Contraposition#Intuitive_explanation

- uvijek True     -> tautologija  
- uvijek False    -> kontradikcija
- kako kad        -> kontigencija

Zadovoljiva formula je ona koja MOŽE BITI TRUE, za neke vrijednosti parametara.  
Tj. satisfiable je ako nije uvijek FALSE.. logično

### Kvantifikatori
Imamo dva kvantifikatora: "za svaki" i "postoji (bar jedan)".  
Obrnuto od "za svaki" je "postoji jedan da nije".  
Obrnuto od "postoji" je "nije nijedan".  

## Predikati
Predikat `P(x)` je iskaz čija vrijednost zavisi od varijable `x`.  
Može zavisiti i od više varijabli, naravno.  
Ovo je u programiranju funkcija `T => Boolean`.


## Princip dobre uređenosti (well ordering principle)

"Svaki neprazni skup prirodnih brojeva postoji najmanji element."  
Čim je skup, svi elementi su različiti. 
Pošto su cijeli, mogu se poredit, tj. zna se koji je manji između svaka dva. ŠTD :D  
Btw, što mora bit nenegativnih??? Zato što morebit beskonačan skup, pa kad krenemo {0,1,...} ope ima najmanji. :)

Ovaj princip je zgodan kad treba dokazat nešto za sve nenegativne integere.
Hehe, ispostavlja se da je SVAKI KONAČAN SKUP dobro uređen !!! :O ima logike, moraš od nečeg krenut


Npr. želimo dokazat da se svaki razlomak može predstaviti najmanjim činiocima: `a = m/n`.  
Pretpostavimo da postoji razlomak `m0/n0` koji se NE MOŽE predstavit najmanjim činiocima, tj ne može se "skratit".  
Skup C sadrži sve djelioce m0 i n0, nije prazan (po pretpostavci) te po WOP ima najmanji element.  
Pošto možemo podijeliti i m0 i n0 sa p, slijedi:
`(m0/p) / (n0/p) , ali to je m0/n0 `, kontradikcija!

Tj. `m0/p pripada C` a p najmanji, nema logike.. :D


### Dobro uređeni skupovi
Skup je dobro uređen ako svaki njegov neprazni podskup ima najmanji element.
Npr skup R+ ima najmanji element, nulu, ali NIJE UREĐEN. Zato što ima podskupova koji nemaju najmanji element.
Svaki podskup dobro uređenog skupa je i sam dobro uređen. rekurzija.

## Fundamentalna teorema aritmetike
Svaki n>1 iz N se može predstaviti kao PROIZVOD PROSTIH BROJEVA.

---

# Logičke formule
Iskazne varijable se mogu kombinovati, te na osnovu njih dobiti nove iskaze.  
Zovu se još i Boolove varijable.

Osnovne operacije nad njima su `AND`, `OR` i `NOT`.

OVDJE IDU TABLICE ISTINITOSTI.

Koriste se u `if` naredbama, `for`, `while` petljama itd.

