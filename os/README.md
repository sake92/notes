
## Booting
Kad se upali kompjuter, sve počinje od neke fiksne adrese:
- loada se BIOS iz ROMa
- BIOS loada bootloader
- bootloader loada OS kernel itd.

Prije je BIOS kod bio u nekom ROM-u (fixna memorija, neprebrisiva), ali je danas obično u flash memoriji (tako da se može izmijenit/flešovat/updateat).  
UEFI je new kid on the block, koji pokušava unaprijedit BIOS.

BIOS gleda koji su bootable uređaji dostupni, npr. hard-disk, USB, CD i slično.
Postoji i prioritetna lista, npr. želimo da bootamo sa CD-a ako je dostupan.
Sa boot uređaja se učitava bootloader, koji preuzima dalje kontrolu.  

Bootloader mora biti 512 bajtova max ???

## Kernel
Kernel je srce OS-a. On se izvršava u privileged modu, to se seta na samom CPU sa nekom instrukcijom.  
Procesi koji su "obični smrtnici", u tzv user modu se izvršavaju u "normalnom" modu CPU-a.  
User-mode procesi moraju ići preko kernela kada žele da:
- ispisuju na ekran
- čitaju sa tastature i uređaja
- čitaju/pišu fajlove sa hard-diska
- čitaju/pišu sa mreže

To rade preko sistemskih poziva, syscall.  
Syscalls su C library koje OS providea, npr libc na *nix sistemima.

## Procesi
Proces ima svoj PID, process ID.  
On jedinstveno identifikuje dati proces koji se izvršava.

Postoji virtuelni fajl sistem `/proc` na linuxu, u kom možemo pristupiti metapodacima o datom procesu.  
Npr. `/proc/32/environ/` su env varijable procesa s PID-om `32`.

### Trenutni folder procesa, cwd
Svaki proces ima svoj "current directory" tj. trenutni folder.  
U linuxu se zove `cwd`, može se isprintat u bashu sa `pwd`.  
Npr. ako otvorimo bash u `/opt/bla` i pokrenemo program `abc.jar`,
njegov `cwd` će biti taj folder, `/opt/bla` tj. **naslijediće ga od parent procesa**.

Eh sad, ako u tom programu čitamo npr. `nesto/fajl.txt`, to se gleda **relativno u odnosu na cwd**!  
Ovo je u suštini najbitnije kad se programira.. :D

Ovaj cwd se može i promijeniti (u C-u bar, ne radi u Javi), sa `chdir`.


## Fajlovi

Osnovni system calls su `open`, `close`, `read`, `write`.  
Fazon je da se radi **što manje sistemskih poziva**!  
Zato što to zahtjeva switchanje konteksta, kopiranje podataka iz user-space u kernel-space itd.  
A to zahtijeva dosta vremena.

Zato CLIB library (standardni C library) ima funkcije kao što su `fwrite`, `fprint`, `fread` i sl. koje **bufferuju** podatke!  
Obično je ovaj buffer `8000` bajtova.  
Npr. ako odradimo `fwrite` od `500` bajtova u fajl, kernel neće odma zapisati te podatke u fajl, već će sačekati da se buffer napuni do svog limita. Tek tada će zapisati (flushati) te podatke u fajl.  
Ako neki proces u međuvremenu htjedne pročitati te podatke iz fajla, kernel će mu dati podatke iz buffera. :) Predobro!

`Stderr` je poseban jer se on ne bufferuje, zato što su greške vrlo bitne i želimo ih odmah vidjeti.  
`Stdout` je *line-buffered* tj. kada se pojavi newline tek će onda se flushati, ispisati na ekran.
Ovo može biti problem kada se radi sa `stdin`, kada čitamo podatke. Npr. ispišemo nešto, npr. "Unesite broj:" i onda kažemo `getchar`.  
Ako stdout nije flushan, korisnik uopće neće vidjet tu poruku ahahahha.  
Zato pozovemo ručno `fflush()` i stdout će se flushati, ispisati sve što je bufferano.


### Memory mapped fajl/device
To je fajl/uređaj koji je namapiran na dio RAMa, najčešće kroz neki **array/buffer**.  
Kada pišemo u taj bafer, to se propagira u fajl, i obrnuto! :)

### Privilegije
Koristi se `chmod` za mijenjanje privilegija nad fajlovima.  
Vrste privilegija su Read, Write i Execute.

Postoje 3 dijela za dodjelu privilegija: user, group i other.  
Provjeravanje se vrši s lijeva na desno:
- ako je `effectiveUserId==fileUserId` provjere se user privilegije
- ako je `effectiveGroupId==fileGroupId` provjere se group privilegije
- u suprotnom provjere se other privilegije..

Ovdje može doći i do **konfliktne situacije**.  
Npr. ako user-ova grupa ima privilegiju READ, a sami user nema, on **neće moći pročitati fajl**!  
Zašto? Pa zato što je okinut prvi uslov. :)  
Ni ne provjeri se privilegije grupe, odma je odbijen.

### Symbolic links (symlinks)

Imamo hard link i soft link.  
Koristi se naredba `ln` da se napravi hard link.  
Koristi se naredba `ln -s` da se napravi soft link, on se češće i koristi.

Prije ovoga, moramo objasniti koncept `inode`.  
Inode je samo **pointer na fajl/folder**.  
Ona ne sadrži ni content ni naziv fajla.

Kada kreiramo *hard link*, kreira se još 1 inode.  
Tek lada obrišemo **zadnji inode na fajl**, tada se obriše i sami fajl, sadržaj njegov tj.  

Kada kreiramo *soft link*, kreiramo **novi fajl** čiji je tip softlink.  
Njegov sadržaj je **naziv fajla na koji pokazuje**.  
Taj fajl uopće ne mora ni da postoji... :)  
Ako ne postoji, softlink je *dangling* (viseći).

---
Kad se unlinka fajl, ne obriše se odma već tek kad se zadnji link ukloni, i kad nema više file-descriptora otvorenih ka tom fajlu.  
Ovo je zgodno kad pravimo temp-fajl. Open->unlink->write/read... a obrisaće se *pravo* tek kad se zatvori fajl. :)











