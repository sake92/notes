
https://aaronbloomfield.github.io/pdr/book/index.html

Pipeline:
preprocesor -> compiler -> asembler -> linker

Sastojci:
source -> expanded source -> assembly -> object code -> executable

Source su tekstualni fajlovi, napisani u C-u.  
Preprocesor proširuje source fajlove, umjesto `#include abc` kopiraće cijeli taj fajl tu!
Zatim asembler asemblira te proširene source fajlove u "objektni kod", sa nastavkom `.o`.
Za svaki source fajl generiše se po jedan objektni fajl.
Na kraju linker samelje sve objektne fajlove u jedan finalni executable fajl.

pointer - adresa

## Registri
Dva registra su vrlo posebna: `SP` (stack-pointer) i `BP` (base-pointer).  
`SP` se obično ne mijenja direktno već kroz `push` i `pop`.  
`BP` pokazuje na baznu adresu "stackframe"-a trenutnog poziva f-je.


## Adresni modovi

Sve što nije KONSTANTA ili REGISTAR ($123 ili %rax) odnosi se na MEMORIJUUUUUU.
Bilo koji izraz, npr:
- 0x123 znači M[123]
- (%rax) je M[rax]

Generalni oblik je:
```
ADDRESS(%BASE_ADDRESS, %INDEX, MULTIPLIER)
```
a finalna adresa je `ADDRESS + %BASE_ADDRESS + MULTIPLIER * %INDEX`.  
Svi dijelovi su **opcioni**. Može se navest:
- samo adresa: `0x123` (direktno adresiranje)
- samo bazna_adresa/registar: `(%rax)` (indirektno adresiranje)
- adresa,index,multiplier: `string_start(,%ecx,1)` (adresno indeksiranje, slično kao `mojstring[i]`)



### Moving data

Move instrukcije KOPIRAJU podatke iz SRC u DEST.  
Nije ono na fazon k'o kod fajlova, da "pomjeri" bukvalno.  
Onda bi SRC bio null/nula ili nešto drugo..

Kod x86 instrukcija, SRC i DEST ne mogu biti oboje MEMORIJA!  
Jedno od njih mora biti konstanta ili registar..

Obične MOV instrukcije pomjeraju samo određene bitove,  
npr. ako na 64bit kompjuteru pomjeraš 32 bita donja, gornji bitovi će ostat kakvi su i bili..  
Postoji MOVZ (mov zero) instrukcija koja nulira gornje bitove maksuz.  
Postoji MOVS (mov signed) instrukcija koje ekstenda ZNAK broja koji smo kopirali..


---


- `nešto:`      - labela samo
- `_start:`     - specijalna labela, tj. `void main()` hepek
- `.gobl`       - treba i linkeru ova labela, nemoj brisat
- `.section`    - početak sekcije neke



# Funkcije

Ovo je možda i **najbitniji dio** kod programiranja u assembly jeziku.  
Mora se znati konvencija/protokol, ko će šta brisati, pomjerati itd.  
Najčešće se koristi konvencija iz C jezika, tzv. `cdecl` (C declaration).  

---
## Pozivatelj/caller

Argumenti funkciji se prosljeđuju pomoću steka. Pushaju se s desna na lijevo.  
Npr. kod f-je `int bla(int x, float y)` ide:
```assembly
push y # nije pravi code, samo da pokažem kako ide.. :D
push x
```
Ovdje je **caller** zadužen za brisanje argumenata sa steka.
Znači nakon `call abc` moramo počistiti stek, vratit ga na prijašnje stanje:
```assembly
push y 
push x
call  abc       # pozovemo funkciju abc
addq  $16, %rsp # počistimo x i y sa steka
```

Također, ako smo imali neke bitne vrijednosti u registrima, moramo ih sačuvati na stek, i kasnije restorati.  
To radimo zato što funkcija koju pozivamo ima pravo da ih koristi, može ih prebrisati...  
Registri koji su "prebrisivi"/volatile nazivaju se **caller-saved registers**!

---
## Pozvani/callee (pozvana f-ja)
Registar `rbp` je poseban pravo (BASE POINTER).  
On označava gdje počinje "stackframe" trenutnog poziva funkcije.  
U odnosu na njega znamo gdje se nalaze **lokalne varijable** i **argumenti** ovog poziva funkcije itd.

Kada se pozove data f-ja, moramo sačuvati `%rbp` **prethodne funkcije** i vratiti ga, da bi f-ja koja nas je pozvala mogla nastaviti sa svojim radom dalje:
```assembly
push %rbp       # sačuvamo rbp pozivajuće f-je
mov  %rsp, %rbp # referentna tačka OVE F-je
...             # kod OVE F-JE
pop  %rbp       # restoramo rbp pozivajuće f-je
```

### Lokalne varijable


### Rezultat
Rezultat se spremi uvijek u **rax** registar.












