
# Prebrojavanja

Recimo da imamo skup S={A,B,C,D}. 
Na koliko načina možemo odabrati 2 elementa ovog skupa?
Odgovor zavisi od uslova koje postavimo: 
- da li se smiju ponavljati?
- da li je bitan redoslijed?

Znači imamo **4 moguća odgovora**  

Terminologija:
- kod "varijacija" je **bitan redoslijed**.  
- kod "kombinacija" elementi se **ne smiju ponavljati**.

## Varijacije s ponavljanjem
Ako se elementi smiju ponavljati, i bitan je redoslijed.  
Iz skupa od `n` elemenata biramo njih `k`:  
V = n^k

Iz prvog primjera bilo bi `V = 4^2 = 16` varijacija.  
Intuitivno, odaberemo na prvo mjesto jedan od 4 elementa,
na drugo mjesto jedan od 4 elementa, a to je 4*4=16.

## Varijacije bez ponavljanja

Intuitivno, ovdje nakon svakog koraka imamo manje jedan element za izbor
(jer se ne smiju ponavljati).  
Dakle umjesto `n*n*n...` biće `n*(n-1)*(n-2)...`.  

Ali dokle? :) Prethodno je bilo `k` n-ova.
Sada se množi do `n-k+1`, tj:

V = n*(n-1)*..(n-k+1)


Iz prvog primjera bilo bi `V = 4*3 = 12` varijacija.  
Zato što je `n-k+1 = 4-2+1 = 3`

# Permutacije
Poseban slučaj biranja je kada iz skupa od n elemenata biramo n elemenata, bez ponavljanja.
Ukupan broj permutacija je `P = n!`, gdje je `!` oznaka faktorijela.  
Za naš primjer to bi bilo `4! = 4*3*2*1 = 24`.  
Npr. na koliko načina možemo obići 5 rođaka za bajram? Pa na `5! = 120` načina.



