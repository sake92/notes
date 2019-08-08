
Kartezijev proizvod skupova A i B je skup AxB,
gdje su elementi skupa uređeni parovi (a,b) | a iz A, b iz B.  
Tj. kombinacija svih elemenata iz A sa svakim iz B.

# Funkcije
Funkcija predstavlja mapiranje iz jednog skupa na drugi.  
To je ustvari skup parova (a,b) koji su u nekoj relaciji.
```
f: A -> B  
f = { (a,b) | a iz A, b iz B }
tj (a,b) iz AxB
```

Skup A je domena, skup B je kodomena.  
Ako je f definisana za svaki element A, onda je totalna. 
U suprotnom je parcijalna.

Podskup vrijednosti f(x) iz B je slika funkcije f, range.

f . g = g(f(x))

### Jedan-na-jedan
Funkcija je 1:1 (bijekcija) akko za ´x1!=x2 => f(x1)!=f(x2)´, odnosno ako za različite ulaze dobijamo različite izlaze.  
Npr. funkcija ima inverz samo ako je 1:1. Inverz je funkcija ´g´ za koju vrijedi `y=f(x) => g(y)=x`.  
Tj. mora biti istovremeno i injekcija i sirjekcija... xD  
Što će reći da je **bijekcija**, dvosmjerna, logično. :p

Također, vrijedi i `g(f(x)) = id`, kompozicija f i g daje identitet funkcije f.  
Ako postoji, g je jedinstvena funkcija.

# Binarne relacije
Relacije također mapiraju jedan skup u drugi.  
Također su skup parova (a,b)... :D    
Funkcije su posebna vrsta relacije.  
Kod funkcija, element iz A može biti u relaciji **sa najviše jednim elementom** iz B!

Kod relacija to generalno nije slučaj. Npr. relacija `<` (manje od) uparuje svaki broj n sa svim brojevima većim od njega.

Ako je R relacija, `a R b` označava da je a u relaciji s b.  
Obično crtamo dijagrame sa strelicama iz A u B.  
Ovi dijagrami su ekvivalentni usmjerenim grafovima.

Na osnovu strelica koje *izlaze iz A* (out), a *ulaze u B* (in), možemo definisati sljedeća svojstva binarnih relacija:
- funkcija: ako je [<= 1 out]
- totalna: ako je [>= 1 out] tj. sve iz domene ima strelicu
- injekcija: ako je [<= 1 in]
- sirjekcija: ako je [>= 1 in] tj. sve iz kodomene ima strelicu (kaže se još i "onto", naški "na")
- bijekcija: ako je [= 1 out] i [= 1 in] tj. istovremeno sirjekcija i injekcija

Funkcija je u ogledalu injekcija.  
Totalna je u ogledalu sirjekcija.  


