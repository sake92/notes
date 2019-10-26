
# Djeljivost

Ako je broj `b = a*k`, onda kažemo da `a` dijeli `b`, piše se: `a|b`.  
Za svaki broj vrijedi:
- n|0
- n|n
- 1|n
- -1|n
- 0|n => n=0

Ako a|b i b|c => a|c   
Ako a|b i a|c => a|(s*b + t*c)   

Formula `s*b + t*c` je *linearna kombinacija b i c*.


## Ostatak
Ako broj `n` nije djeljiv s `d` onda ima oblik:  
`n = d*q + r`, gdje je `0<r<d` ostatak dijeljenja.  
Broj `q` se naziva kvocijent (en. quotient).  
Broj `r` se naziva ostatak (en. remainder).


Piše se `rem(13,4) = 1`, jer `13 = 4*3 + 1`.

U programiranju se koristi `%`, npr. `13 % 4 == 1`.

Obično se daje uslov da je `0<r<d`, jer u suprotnom ostatak nije jedinstven.
Npr:  
- `13 = 4*3 + 1`
- `13 = 4*2 + 5`
- `13 = 4*4 + (-3)`
- ... i tako dalje


### Klase ekvivalencije
Ako zanemarimo zadnji uslov, `0<r<d` možemo dobiti skup brojeva djeljivih sa d, koji se naziva "klasa ekvivalencije mod d": {...,-2d,-d,0,d,2d,3d...}

Npr. klasa ekvivalencije mod 7 je {...,-14,-7,0,7,...}

## Najveći zajednički djelilac, NZD (en. GCD)

To je broj koji dijeli i `a` i `b`, npr. `gcd(12,4)=4`.

Euklid je birvaktile skonto algoritam za nalaženje gcd:  
`gcd(a,b) = gcd(b, rem(a,b))`

### gcd dijeli (a-b)
Zgodna činjenica pri traženju gcd je ta da gcd dijeli i (a-b). Npr. ako su a i b veliki brojevu, oduzmemo ih i nađemo djelioce tog broja. :)  
Dokaz:
c | a => a=c*m  
c | b => b=c*n  
(a-b) = (c*m - c*n) = c(m-n)  
=> c | c(m*n) ŠTD.

Primjer: gcd(12,8)  
Dakle, gcd | (12-8) = 4  
Što će reći, djelioci broja 4 su jedini mogući gcd: 4,2,1.  
Krenemo od najvećeg i probamo, dakle 4 je gcd...



