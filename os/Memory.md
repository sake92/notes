
# Memorija

## Fizička memorija
Fizička memorija je (generalno) RAM memorija, adresirana od `0` do `M.size-1`.  
Programeri skoro nikako ne barataju fizičkom memorijom.  
To je zadatak kernela.  
Osim mapiranja virtuelne na fizičku memoriju, kernel također **kontroliše pristup** datim lokacijama.  
Zato dobijemo "segmentation fault" (segfault) kad pokušamo pristupiti đe ne smijemo!

## Virtuelna memorija

https://www.memorymanagement.org/glossary/v.html#term-virtual-memory

Programeri barataju samo s virtuelnom memorijom.  
Npr. kod Linuxa, proces se loada na fixnu adresu u virtuelnoj memoriji: `0x08048000`.  
Pošto je ona *virtuelna*, svaki proces ima "po jednu", dok su njihove *fizičke adrese* potpuno drugačije.  
Ovim je olakšano baratanje adresama, rasterećen je programer.

U pozadini postoji **tabela mapiranja** koja kaže kojoj virt. adresi odgovara koja fizička adresa.  
Fizička adresa **može biti i na disku**, ne mora biti samo RAM.  
Kernel odrađuje taj posao mapiranja. Npr. ako ta adresa nije u RAMu, kernel je loada đe ima mjesta.  


### Paging
Ako nema mjesta (page fault) onda OS swapa neki dio RAMa na disk da bi napravio mjesta.  
Eh sad, kolko će kernel memorije swappati naziva se "page size", a koncept "paging". 
Na Linuxu je to 4096 bytes.

Kad vidimo s "top" komandom kolko memorije uzima proces, vidjećemo kolonu RSS ili RES.  
To je memorija koja je uloadana fizički u RAM. 
Naziva se "rezidentna memorija".

## Management

Pošto ne znamo unaprijed kolko će nam memorije trebat, moramo imati mehanizam za 
- **alociranje** (daj mi još memorije) i 
- **dealociranje** (ne treba mi više ovaj komad memorije)

Funkcije koje obavljaju ovakve poslove nazivaju se skupno "memory manager".  
U C-u su najpoznatije `malloc` i `free`.

Dio memorije koju koristi memory manager naziva se **heap**.


















