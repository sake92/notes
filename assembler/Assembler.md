
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

---
Adresni modovi

Sve što nije KONSTANTA ili REGISTAR ($123 ili %rax) odnosi se na MEMORIJUUUUUU.
Bilo koji izraz, npr:
- 0x123 znači M[123]
- (%rax) je M[rax]

---
Moving data

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






