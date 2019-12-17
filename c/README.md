


## Booleans
- 0 == false
- (bilo koji broj != 0) == true

## Statements
Statement `x=abc()` vraća vrijednost `x` nakon dodjele.  
Zato se ovo često koristi inline u `while` petljama:

```c
int c;
while ((c=getchar()) != EOF) {
    // ...
}
```

## Variable scopes
http://faculty.cs.niu.edu/~freedman/241/241notes/241var2.htm

1. Lokalne varijable ("automatske")  
Vrijede samo u scope-u date funkcije.  
Re-kreiraju se pri svakom pozivu f-je.  
U C-u ih zovu još i "automatske", može se stavit prefix `auto int x = 5;` ali je višak.
2. Globalne varijable  
Deklarišu se izvan svih funkcija, i dostupne su **svim funkcijama**.  
Može se deklarisat u jednom a pristupiti joj **iz drugog fajla** 
koristeći `extern int x;` u drugom fajlu.
3. Statičke varijable  
Lokalne statičke su vezane za f-ju. Ne uništava se između 2 poziva f-je.  
Globalne statičke su vezane za fajl.

## Funkcije
Funkcije koje su `static` su vidljive **samo u tom fajlu**.  
Bez static su globalne, vide se iz drugih fajlova...


## #define
Hešteg define je kao find-and-replace, bukvalno traži izraz i zamijeni ga s vrijednošću.  

## Pointers
Pointer/pokazivač je tip koji sadrži ADRESU nečega.  
Deklariše se sa `tip *varPokazivac`.  
Adresa nečega se može dobiti sa `&varijabla`.  

Vrijednost **na koju pokazuje pokazivač** se može dobiti/izmijeniti sa `*varPokazivac` (tzv. dereferenciranje).  
Npr. da bismo inicijalizirali pokazivač na int, i izmijenili ga:
```c
int x = 5;

int *pokInt = &x;

*pokInt = 6;

printf("x=%d", x); // 6
```

---
Postoji i generički pointer `void*`.  
Može pokazivati na bilo šta!  
Međutim, on **ne može biti dereferenciran**!

---
U C-u nula `0` **nije validna adresa**.  
Ima alijas/konstantu `NULL`.

## Arrays
Nizovi se deklarišu s `tip arr[];`.  
Ovo `arr` je u suštini **pokazivač**!  
Tj. `char *pokazivac = arr;`

Zato je isto `arr[2] = 5` i `*(arr+2) = 5`.  
Ovo se još naziva i "pointer arithmetic".

Npr. ako imamo f-ju `int abc(char *x) {}`,  
možemo je pozvati kao:  `abc(arr)`, `abc("Hello")` i `abc(pointer_neki)`.  
F-ju `abc` možemo deklarisati i sa `int abc(char x[]) {}`,  
ali tada nismo mačo-programeri...

Pointerima možemo nadodavati integere, pointer se tad pomjeri za n adresa.  
Npr ako je `double *x`, onda `x += 3` pomjeri adresu za vrijednost memorije 3 double-a.

## Redoslijed evaluacije
U C-u nije specificiran redoslijed evaluacije.  
Npr. u Javi je UVIJEK s lijeva na desno.  
Kod različitih C komapjlera, kod izraza `f() + g()`
se može evaluirati prvo f pa g ili g pa f.
Oboje poštuju standard.  
Isto je i npr. za `a[i] = i++`, ne zna se kojoj vrijednosti `i` će dodijelit...




## Structs

Struct se prosljeđuje u f-ju "po vrijednosti" tj. kopira se **cijela struktura, njene vrijednosti**.  
Nije ono ko u Javi da se kopira samo referenca!!!  
Zato se obično prosljeđuje samo **pointer na strukturu**!  
Kad se dereferencira ide `(*my_struct).x = 5;` ili `my_struct->x = 5;`













