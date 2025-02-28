
# Compiler

Faze:
- precompile
- compile
- assembly
- link
- runtime link


## Precompile
Prekompajler obradi preprocesorske direktive kao što su `#define` i `#include`.
Prijaviće sintaksne greške u preprocesorskim direktivama, ili ako ne nađe header fajlove
```sh
gcc -E myprog.c > out
cat out
```

Preprocesor **sastavi sve header fajlove u jedan** i doda `.c` fajl na kraju...  
(surprised Pikachu)  
Npr ako ima `#if` i sl, false grane će zamijenit sa whitespace.  
Expandaće makroe `#define` itd.

https://en.wikipedia.org/wiki/C_preprocessor

## Compile
Ovaj korak odradi većinu posla, pretvori `.c` fajlove u `.s` fajlove (*tekstualni* assembly kod, specifičan za mašinu na kojoj se kompajlirao).

```sh
gcc -S myprog.c
cat myprog.s
```

## Assembly
Assembly korak pretvori assembly kod u *premjestivi binarni objektni kod* (myprog.o), mašinski kod.
```sh
gcc -c myprog.c
objdump -d myprog.o
```

Ovi fajlovi su u ELF formatu (Executable and Linkable Format).

## Link
Ovaj korak kreira jedan EXEcutable fajl (a.out) od premjestivog binarnog objektnog koda (.o)i library-ja (.a ili .so).  
I ovaj fajl je u ELF formatu!

Provjeriće i linkati sve reference na simbole.
Npr ako pozovemo `printf` funkciju, probaće je naći nekom od `.o`/`.a`/`.so` fajlova.

```sh
gcc myprog.c
# run
./a.out

# disassemble mašinski kod nazada u assembly
objdump -d a.out
```

## Runtime Link
Ovaj korak se odradi u **prilikom pokretanja programa** (runtime), prije `main`a.  
Ako je bilo dinamičkih library-ja (`.so` fajlova) uključenih u EXE, moraju se resolvat u runtime.  
Ako na datom kompjuteru ne postoje potrebni library, srušiće se program.

```sh
# izlista potrebne dinamičke libove
ldd a.out
```

Koristi se Procedure Lookup Table PLT za praćenje dinamički loadanih library.


## Windows
- `.so` ima ekvivalent `.dll`
- ELF ima ekvivalent Portable Executable (PE) format



---
---
---

# Library
Sadrži neki reusable kod.  
Ne može se pokrenuti.

Sastoji se iz:
- API-ja: header fajlova `.h`
- implementacije: obično u već kompajliranom formatu:
    - `.a` arhiv fajlova koji sadrže `.o` relocatable objektni kod, koji se statički linkaju
    - `.so` fajlova (shared object file) koji se dinamički loadaju u runtime (kada se pokrene program)

## Statičko linkanje library-ja
Kopira library kod u finalni EXEcutable fajl.  
Što znači da taj library **ne mora postojati na sistemu** gdje se instalira(kopira) EXE.

## Dynamičko linkanje library-ja
GCC se oslanja na sistemske library(`.so`) da budu u standardnim folderima kao što su 
`/usr/include`, `/usr/lib`...  
Također će gledati i u trenutni folder, naravno.  
Mogu se dodat custom pathovi sa `-I` (headeri `.h`) i `-L` (implementacije `.so`).

Prilikom **runtime linkanja** (kad se pokreće program), library moraju biti na `LD_LIBRARY_PATH`-u (env var).

---

Neki su library uključeni po defaultu.  
Neki se library moraju dodati kad se program linka, sa `-l` flegom:

```sh
gcc -o myprog myprog.c -lpthread -lreadline
```

Ne stavlja se nikakav nastavak (`.a` ili `.so`), niti verzija library-ja.  
Kompajler će obično uzeti najnoviju verziju library-ja.  

Ako imaju obe verzije: `.a` (static) ili `.so` (dynamic), kompajler će uzet `.so` (dynamic).  
User može forsirat static sa `--static`:

```sh
gcc -o myprog myprog.c --static -lpthread -lreadline
```
