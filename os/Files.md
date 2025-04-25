
# Fajlovi


Files in Linux are not only "physical files" but also sockets, pipes, devices, terminals...  
They're unified under a unique abstraction called a "file".

When you open a file you get a "file descriptor".

Every process inherits 3 basic file descriptors:
- stdin, standard input (Console input), with FD 0 
- stdout, standard output (Console output) with FD 1
- stderr, statndard error (Console error) with FD 2


Osnovni system calls su `open`, `close`, `read`, `write`.  
Treba da se radi **što manje sistemskih poziva**, jer performance!  
Zato što to zahtjeva switchanje konteksta, kopiranje podataka iz user-space u kernel-space itd.  
A to zahtijeva dosta vremena.

Zato CLIB library (standardni C library) ima funkcije kao što su `fwrite`, `fprint`, `fread` i sl. koje **bufferuju** podatke!  
Obično je ovaj buffer `8000` bajtova.  
Npr. ako odradimo `fwrite` od `500` bajtova u fajl, kernel neće odma zapisati te podatke u fajl, već će sačekati da se buffer napuni do svog limita. Tek tada će zapisati (flushati) te podatke u fajl.  
Ako neki proces u međuvremenu htjedne pročitati te podatke iz fajla, kernel će mu dati podatke iz buffera. Top!

`Stderr` je poseban jer se on ne bufferuje, zato što su greške vrlo bitne i želimo ih odmah vidjeti.

`Stdout` je *line-buffered* tj. kada se pojavi newline tek će onda se flushati, ispisati na ekran.
Ovo može biti problem kada se radi sa `stdin`, kada čitamo podatke. Npr. ispišemo nešto, npr. "Unesite broj:" i onda kažemo `getchar`.  
Ako stdout nije flushan, *korisnik uopće neće vidjet tu poruku*...  
Zato pozovemo ručno `fflush()` i stdout će se flushati, ispisati sve što je bufferano.


## Memory-mapped fajl/device
To je fajl/uređaj koji je namapiran na dio RAMa, najčešće kroz neki **array/buffer**.  
Kada pišemo u taj bafer, to se propagira u fajl, i obrnuto!  
Ovako izbjegavamo syscalls i medijaciju kernela.

## Privilegije
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

## Symbolic links (symlinks)


Prvo moramo objasniti koncept `inode`-a.  
Inode je samo **pointer na fajl/folder**, interna data structure koju OS koristi.  
Inode ne sadrži ni content ni naziv fajla.

Imamo hard link i soft link.  
Koristi se naredba `ln` da se napravi hard link.  
Koristi se naredba `ln -s` da se napravi soft link, on se češće i koristi.

### Hard link
Kada kreiramo *hard link*, kreira se novi inode.  
Tek kada obrišemo **zadnji inode na fajl**, tada se obriše i sami fajl, tj njegov fizički sadržaj.  


### Soft link

Kada kreiramo *soft link*, kreiramo **novi fajl** čiji je tip softlink.  
Njegov sadržaj je **naziv fajla na koji pokazuje**.  
Taj fajl uopće ne mora ni da postoji... :)  
Ako ne postoji, softlink je *dangling* (viseći).

---
Kad se unlinka fajl, ne obriše se odma već tek kad se zadnji link ukloni, i *kad nema više file-descriptora otvorenih ka tom fajlu*.  
Ovo je zgodno kad pravimo temp-fajl. Open->unlink->write/read... a obrisaće se *pravo* tek kad se zatvori fajl.

