

## Static vs Dynamic libs


### Static libs
Postoji hrpa objektnog koda negdje u sistemu.  
Kad korisnik include-a neki library, 
**linker kopira kod tog liba** u objektni kod tog programa.

Dupliciran kod na disku, RAMu, ako se **update lib**, mora se sve **ponovo relinkat**!

### Dynamic libs

Ovdje se samo metne referenca na DLL, i onda **u runtime**, **dinamički linker** skonta đe je taj library.  
U RAMu bude loadana samo jedna kopija tog DLL-a.










