
http://users.telenet.be/vdmoortel/dirk/Maths/PermVarComb.html

https://www.mathsisfun.com/combinatorics/combinations-permutations.html

# Prebrojavanja

Recimo da imamo `n` nekih elemenata.  
Imamo 2 često postavljana pitanja u raznim granama nauka:
- na koliko načina možemo **poredati** te elemente? (**permutacije**)
- na koliko načina možemo **odabrati** `k` elemenata? (**varijacije** i **kombinacije**)

Odgovor na prvo pitanje daju permutacije.  
Odgovor na drugo pitanje zavisi od uslova koje postavimo: 
- da li se smiju ponavljati?
- da li je bitan redoslijed?

Znači imamo **4 moguća slučaja**!  

Kod varijacija je **bitan redoslijed**.  
Kod kombinacija je **nebitan redoslijed**.

> Koristićemo primjer elemenata `{A,B,C,D}`.

---
# Permutacije 
## Permutacije bez ponavljanja
Na prvo mjesto možemo staviti bilo koji od `n` elemenata, na drugo `n-1` i sve tako dok ne ostane 1 element:
```
P(n) = n * (n-1) * ... * 1
tj.
P(n) = n!
```
gdje je `!` oznaka faktorijela.  
Za naš primjer to bi bilo `4! = 4*3*2*1 = 24`.  

## Permutacije s ponavljanjem
Sada podijelimo `n` na više njih: `n1`, `n2`, ... .  
Npr. `n1` je broj elemenata `A`, `n2` je broj elemenata `B` ...

Iz ukupnog broja permutacija moramo **izbaciti permutacije koje se ponavljaju**.  
A to radimo dijeljenjem:

```
P(n1,n2,...) = n! / (n1! * n2! * ...)
```
Npr. ako imamo 2 jabuke, 5 oraha i 3 kruške, br. permutacija bi bio:  
`P(2,5,3) = (2+5+3)! / (2! * 5! * 3!) = 10! / (2! * 5! * 3!) = 5*9*8*7 = 2520`.

---
---
# Varijacije
## Varijacije bez ponavljanja

Iz skupa od `n` elemenata **biramo** njih `k`.  
Nakon svakog odabira imamo jedan element manje za izbor
(jer se ne smiju ponavljati):
```
V(n,k) = n*(n-1)*..(n-k+1)
ili
V(n,k) = n! / (n-k)!
```

Za naš primjer bilo bi `V(4,2) = 4*3 = 12` varijacija.  
Zato što je `n-k+1 = 4-2+1 = 3`, znači množimo do `3`.

Druga formula se može shvatiti na sljedeći način:
- `n!` su sve permutacije
- nas zanima samo umnožak prvih `k` brojeva, tako da moramo odstraniti `(n-k)!` njih:  
`V(4,2) = 4! / (4-2)! = 4!/2! = 4*3*2! / 2! = 4*3 = 12`

## Varijacije s ponavljanjem 
Iz skupa od `n` elemenata biramo njih `k`:  
```
V(n,k) = n^k
```

Za naš primjer bilo bi `V(4,2) = 4^2 = 16` varijacija.  
Odaberemo na prvo mjesto jedan od 4 elementa,
na drugo mjesto jedan od 4 elementa, a to je `4*4=16`.

> Npr. ako imamo `{A,A,A,A,A,A,B,C,D}` i biramo 2 elementa, i mogu se ponavljati.  
> Je li nam stvarno bitno da li imamo jedno `A` ili 156 njih?  
> Nebitno skroz! dakle, uzmemo kao da je samo 1 `A` i računamo...
> Pošto imamo 4 slova slijedi: `4*4`

---
---
# Kombinacije
## Kombinacije bez ponavljanja

Redoslijed sada nije bitan.  
Iz skupa od `n` elemenata biramo njih `k`:  
```
C(n,k) = (n nad k) = n! / ((n-k)! * k!)
ili
C(n,k) = V(n,k) / k!
```

Druga formula je možda malo intuitivnija.  
Ako imamo sve varijacije `V(n,k)`, samo trebamo izbaciti "duplikate".  
Npr. ako imamo `k=3`, tada je `ABC=ACB=BAC=BCA=CAB=CBA`, a tih permutacija ima `k! = 6`.  
Tako da samo umanjimo/podijelimo br. varijacija njima.

## Kombinacije s ponavljanjem 

Pošto se sada elementi mogu ponavljati, nemamo više `n` izbora već `n+k-1` izbor.  
Npr. za `k=3` to je `4+3-1=6` jedan od mogućih izbora bi mogao biti `A,B,B,B,C,D` ili `A,A,B,C,C,D`.  
Dakle, moguće je da izaberemo 3 slova `B`, ili 2 slova `A` i jedno `C`.  


```
C(n,k) = (n+k-1 nad k)
tj.
C(n,k) = (n+k-1)! / ((n-1)! * k!)
```
