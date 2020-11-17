
https://www.youtube.com/playlist?list=PL5102DFDC6790F3D0

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
# Prosjeci

## Prosjek / Mean
Samo uzmemo broj uzoraka i podijelimo sa n.

## Medijan
Poredamo brojeve u rastućem redoslijedu i uzmemo srednji.  
Ako je br. uzoraka paran onda imamo problem, jer nemamo srednji broj. Tada uzmemo prosjek 2 srednja broja.


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
# Varijansa
Vrijednost nađena "unutar standardne devijacije", onaj broj unutar korijena...  
Tj. V = s^2















