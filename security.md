
# Teorija

Ako ima BILO KAKAV PATTERN u plain/cipher kombinaciji, napadač će to iskoristit, skontaće nešto...  
Zato cipher algoritam mora:
- da zavisi samo od TAJNOG KEYA
- da za jedan te isti input UVIJEK VRATI RAZLIČIT(random-izgledajući) ciphertext, da napadač ne može tražit patterne na osnovu ciphertexta

## Dužina keya
Za dužinu keya se bira broj bitova, obično 128, 256 i dr.  
To nam daje 2^128 kombinacija, što je puuuno više od broja nanosekundi starosti svemira, 2^88.  
Da bi probali brute-force, trebalo bi nam 2^128 nanosekundi.  
Čak i da imamo sve kompjutere svijeta ne bi mogli brute-force-at ga.  
Ne, čak ni sa quantum-superduper-kompjuterima... :)


## Simetrična enkripcija
Oba učesnika u komunikaciji imaju TAJNI KEY.  
Isti key se koristi i za enkripciju i za dekripciju.


## Asimetrična enkripcija
Samo sender ima PRIVATNI KEY.  
Taj key on koristi za DEKRIPCIJU.

PUBLIC key može SVAKO DA VIDI/KORISTI.  
On se koristi za ENKRIPCIJU.

Dakle, svako može poslat poruku enkriptovanu,  
ali je samo 1 učesnik može dekriptovati, tj. pročitati.


## Block cipher algoritmi

Enkriptuju blok po blok.  
Npr ako imaš 1kb fajl enkriptuje po 128 bitova (ili više).  
Blok ne smije biti premal(security) niti prevelik (zbog performansi).  
Danas (a i ubuduće) 128 bitova je taman, teško ga je dekriptovat (ha koristio 128 ha 256 brute-force ne radi), 
a i performantan je na modernim procesorima.

DES - stari algoritam, nije siguran danas
3DES - sigurniji DES, ali nije performantan
AES - Advanced Encryption System, većina kriptovanja danas se radi preko ovog algoritma



---------- OPENSSL playground ---------

# PRIVATE KEY
Random key (broj obični..):
openssl rand -hex 16



# PRIVATE AND PUBLIC KEY
openssl genrsa 4096

To je base64 encoded privatni key.  
Koristi se base64 radi lakšeg transporta (tekstualni fajl..).

Sad je fazon kako čuvati sigurnim ovaj key...  
SSH to radi tako što dadnemo password, kojim ga on EKRIPTUJE u fajl.  
Ako neko dođe do našeg fajla, ne može ga koristiti bez passworda, tj. mora ga prvo dekriptovat.

Npr:  
openssl genrsa -aes128 4096







