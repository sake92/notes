

## Static vs Dynamic libs


### Static libs
Postoji hrpa objektnog koda negdje u sistemu.  
Kad korisnik include-a neki library, 
**linker kopira kod tog liba** u objektni kod tog programa.

Prednosti:
- manje dependencija, samo kopiraš taj EXE

Problemi:
- dupliciran kod na disku, RAMu
- ako se **updatea lib** -> mora se sve **ponovo relinkat**! (security flaw)


### Dynamic libs

Ovdje se samo metne referenca na DLL, i onda **u runtime**, **dinamički linker** skonta đe je taj library.  
U RAMu bude loadana samo jedna kopija tog DLL-a.










