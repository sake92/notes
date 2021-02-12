
https://www.youtube.com/playlist?list=PL5102DFDC6790F3D0

# Statistika

Statistika nam daje alate za lakše upoređivanje stvari.  
Npr. u fudbalu znamo procente za svakog igrača, koliko golova daje po utakmici, kakav je u odbrani i sl.  
Pomoću tih brojeva možemo poprilično lako uporediti 2 igrača.

U ekonomiji se koristi "gini index" za određivanje "nepravednosti" u prihodima.  
Što je index veći, to je stanje u toj državi nepravednije, neki ljudi su baš bogati a neki siromašni. Tj. nema srednje klase.

Ovi brojevi **nisu savršeni** ali služe svrsi.  
Sigurno su jedan od boljih pokazatelja za poređenje.  
Ne treba se oslanjati samo na statistiku! Uvijek treba pogledati širu sliku.

## Prikazivanje (statističkih) podataka
Podaci se mogu prikazati na razne načine:
- tekstom, npr. 1 od 10 pušača dobiće rak pluća (izmišljam...)
- tabelom
- grafikom: pita, stupci, scatter-plot i sl.

Kod izražavanja tekstom, **procenti su često zbunjujući**.  
To se dešava jer neki ljudi žele da manipulišu javnošću, te "navode vodu na svoj mlin". :)  
Procenti se mogu odnositi na prethodnu vrijednost, npr. ako je rizik bio 10 od 100 a sada je 13 od 100,
tada je **relativni porast** 30% !!!  
Ali, vidimo ustvari da je **apsolutni porast** samo 3%.  
Zavisi da li želimo zastrašiti ljude, ubijediti kupce da kupe naš proizvod i sl. ;)

Isto vrijedi i za razlomke, je li 3/53 > 6/35 ?  
Malo ko voli rješavati komplikovane razlomke...

Najintuitivniji prikaz je `x od 100 ljudi` npr.  
Vrlo je lako ljudima da ga shvate otprve.

## Populacija vs uzorak
Populacija su svi objekti (100%).
Njihov broj se označava velikim slovom N.
  
Uzorak je dio populacije, ispitanici ili random uzorci itd.  
Njihov broj se označava malim slovom n.  

Uzorak mora biti **fer i mjerodavan**.  
Npr. ako uzimamo mišljenje o religijama, bilo bi fer uzeti pomalo ljudi iz svih religija.  
Sve *relevantne skupine* moraju biti prisutne u uzorku.

## Parametar vs statistički podatak
Parametar je neka karakteristika populacije.  
Npr. možemo znati % plavookih ljudi: `u = br_plavookih/N`  

Statistički podatak je neka karakteristika uzorka.  
Npr. koji je % plavookih ljudi **u našem uzorku**: `x' = br_plavookih/n`  


---
---
# Prosjeci

## Prosjek / Mean
Samo uzmemo broj uzoraka i podijelimo sa n.

## Medijan
Poredamo brojeve u rastućem redoslijedu i uzmemo srednji.  
Ako je br. uzoraka paran onda imamo problem, jer nemamo srednji broj. Tada uzmemo prosjek 2 srednja broja.

> Npr. kad nas političari levate da je prosječna plata 1000KM, oni gledaju prosjek/mean.  
> A u suštini medijan je puno bolja ocjena stanja u državi!
---
---
# Devijacija
Devijacije ili odstupanja se obično mjere **u odnosu na prosjek**.  
To je ustvari **prosjek odstupanja vrijednosti**.

## Prosječna apsolutna devijacija
Nađemo razlike od prosjeka za svaki uzorak, uzmemo apsolutne vrijednosti i nađemo prosjek.

Npr. ako imamo vrijednosti: 1,3,14  
Prosjek je: (1+3+14)/3 = 6  
Nađemo razlike: (1-6), (3-6), (14-6) = -5, -3, 8  
Nađemo abs-ove: 5, 3, 8  
Devijacija je (5+3+8)/3 = 5.33  


## Standardna devijacija, SD
Ima poprilično komplikovanu formulu(više njih), sa kvadriranjem i korjenima.  
https://bs.wikipedia.org/wiki/Standardna_devijacija

Poznato je da pojačava outliere (vrijednosti koje puno odstupaju).  
Koristi se vrlo često. Mada ne znam zašto je "bolja" od prethodne, koja je jednostavnija.

Npr. ako imamo vrijednosti: 1,3,14  
Devijacija je ....... `s = 7`

Vidimo da SD više "laže" koliko je odstupanje, but hey.. :D


## Empirijsko pravilo, pravilo "68-95-99.7"

Ako je uzorak "normalno distribuiran" (zvonce), 
tj. nema outliera puno, tada možemo primijeniti ovo pravilo.  
Ono kaže da skoro svi posmatrani podaci iz uzorka spadaju unutar 3 SD-e.  
Ono predviđa da:
- 68% podataka spada u 1 standardnu devijaciju, tj. `x' +- s`
- 95% podataka spada u 2 standardne devijacije, tj. `x' +- 2s` ("uobičajene vrijednosti")
- 99.7% podataka spada u 3 standardne devijacije, tj. `x' +- 3s`  ("vrlo rijetke vrijednosti")

## Z-skor, Z-index
Udaljenost vrijednosti od prosjeka, mjereno u Standardnim devijacijama:  
z = (x-x') / s

Što je z-index veći, to je podatak rjeđi...  
Koristi se za **poređenje uzoraka**, npr. ako su oba random, z-index bi trebao biti poprilično isti.

---
---
# Varijansa
Vrijednost nađena "unutar standardne devijacije", onaj broj unutar korijena...  
Tj. V = s^2

TODO

---
---
# Kvantili
Kvantil je broj koji dijeli **sortirane podatke** na k dijelova.  
Ovo baš baš ima veze sa **medijanom**! :D  
Najkorisniji su kvartili i percentili.

## Kvartili, quartiles

Kvartil je broj koji dijeli **sortirane podatke** na četvrtine.

- Q1, označava donjih 25%, 1/4
- Q2, označava donjih 50%, 1/2
- Q3, označava donjih 75%, 3/4

Nađemo medijan i to je ustvari Q2.  
Nađemo medijan ispod Q2 i dobićemo Q1.  
Q3 isto nije težak.. :D

Npr. za 1,3,6,10,15,21,28,36  
Q2 = 12.5; Q1 = 4.5; Q3 = 24.5; 

Kad imamo neparan broj podataka, medijan se ne uključuje kad se traži Q2 i Q3...

> Npr. kad kažemo da je br. bodova studenta u zadnjem kvartilu, znači da je on u najboljih 25%. 
> (podaci su sortirani u rastućem redoslijedu)

### Petobrojni sažetak
Treba nam 5 brojeva da bi napravili mali sažetak naših podataka:
- minimalna vrijednost
- Q1
- Q2 / medijan
- Q3
- maximalna vrijednost

Ovdje se nacrta fina kutijica tipa:

```
          Q1|....M.......|Q3
min |.......|    |       |.............| max
            |....|.......|
```

Logično, medijan ne mora biti baš na sredini, pa vidimo odokativno kako su nam podaci raspoređeni.


### IQR - Interquartile range
Označava raspon srednjih 50% podataka.  
`IQR = Q3 - Q1`

Pomoću IQR definišemo šta je **outlier**:
- sve > od `Q3 + 1.5*IQR`
- sve < od `Q1 - 1.5*IQR`

---
## Percentili
Percentil je broj koji dijeli **sortirane podatke** na stotke/procente.  
Imamo 99 percentila.

`percentil(x) = (br_podataka_manjih_od_x / n) * 100`

Obično se označava sa `p_n` gdje je n broj od 1 do 99, npr p50 (medijan), p95, p99.  
Npr. kad kažemo da je p99 manji od 200ms, to znači da je 99% requesta brži od 200ms.

Ova konstatacija ima i svoj **dual**, drugu stranu novčića.  
Možemo reći i obrnuto, vjerovatnoća da request bude brži od 200ms je 0.99 tj. 99% ! Zgoda!






# Korelacija
https://www.mathsisfun.com/data/correlation.html

Kad imamo 2 varijable, i hoćemo da vidimo da li su **povezane nekako**,
najlakše je nacrtati scatter-plot grafikon.  
Na x osi je jedna varijabla a na y druga varijabla.

Dva skupa podataka su u korelaciji ako im je rast/pad zajednički.  
Ako su podaci "raštrkani" na grafu, onda nisu u korelaciji.

U Excelu ima funkcija `CORREL` koja ovo izračunava.  
Lakše je nacrtat samo graf i pogledat ga, al haj... :D  
Ova vrijednost naziva se **koeficijent korelacije**, i ima vrijednost od -1 do 1.

VRLO BITNO:  
Ako su podaci u korelaciji to **ne znači da jedna varijabla uzrokuje drugu** !!!  
Correlation is not causality!

Npr. ako je prodaja sladoleda u korelaciji sa prodajom sunčanih naočala,
to ne znači da ako prodamo više sladoleda, da će se prodavati više naočala...  
Nedostaje nam neki dodatni "insight", neka povezna varijabla, ako je ima!?  
U ovom slučaju ima, i to je temperatura. Ona uzrokuje rast/pad obe ove varijable.

----
U normalnim državama postoji standardizovani test nakon završene srednje škole.  
Ovaj test je isti za sve učenike.  
Koristi se za "demokratizaciju upisa na fakultete".  
Koliko je on ustvari "bolji" za predviđanje uspjeha brucoša(studenti koji su tek upisali fax) od recimo prosječne ocjene?  
Što bi ovaj ispit bio bolji i mjerodavniji?

Pa zato što nisu sve škole, profesori a ni učenici isti!  
U Americi su odradili odvojene korelacije za prosjek ocjena i SAT test.  
Ispalo je da im je **korelacija sa uspjehom ista**: 0.56 !!  
Da li to znači da su džaba bacili pare na SAT testove i gubili vrijeme!?  
NE! U kombinaciji, prosjek+SAT ima korelaciju od 0.64! :)

### Formula za korelaciju
Odnosi se na 2 varijable, A i B.  
Ovo je ustvari **linearna korelacija**, obična linija.  
2 varijable mogu biti u korelaciji i po nekoj komplikovanijoj formuli:
- kvadratna jednačina
- hiperbola i sl...

Formula/algoritam:
- nađemo z-indekse za svaki element iz A.  
- nađemo z-indekse za svaki element iz B.
- pomnožimo ove z-indekse i saberemo ih.
- podijelimo sa N, brojem uzoraka

Ovaj broj se naziva i Pearsonov koeficijent, označava se sa `r`:
```
r = SUM(z1 * z2) / N
```

Znamo da je z-index ustvari br. std. dev. od prosjeka.  
Ako *uvijek* z1 raste i z2 raste, tada je korelacija pozitivna.  
Ako *uvijek* z1 raste i z2 opada (ili kontra), tada je korelacija negativna.


