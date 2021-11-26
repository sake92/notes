

https://www.amazon.com/Serious-Cryptography-Practical-Introduction-Encryption/dp/1593278268

plaintext - input tekst, čisti tekst....

ciphertext - enkriptovani tekst

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

## Pristupi enkripciji
Postoje 2 načina enkripcije koji se danas koriste:
- simetrična, gdje 2 učesnika dijele privatni key
- asimetrična, gdje SVI učesnici dijele public key, ali samo jedan ima privatni(može dekriptovat poruku)

---------------------------------------
---------------------------------------
# Simetrična enkripcija

## Block cipher algoritmi

Enkriptuju blok po blok.  
Npr ako imaš 1kb fajl enkriptuje po 128 bitova (ili više).  
Blok ne smije biti premal (security) niti prevelik (zbog performansi).  
Danas (a i ubuduće) 128 bitova je taman, teško ga je dekriptovat (ha koristio 128 - ha 256 -> brute-force ne radi), 
a i performantan je na modernim procesorima.

- DES - stari algoritam, nije siguran danas
- 3DES - sigurniji DES, ali nije performantan
- AES - Advanced Encryption System, **većina kriptovanja danas se radi preko ovog algoritma**


-------------------------------
### AES
AES procesira blokove **po 16 BAJTOVA** tj 128 bitova.  


AES modovi:
- ECB (not secure)
- CBC (kinda secure, ali vulnerable na padding oracle attacks, POODLE)
- CTR, PREPORUČEN ZA KORIŠTENJE (koristi stream cipher u pozadini)

https://security.stackexchange.com/questions/52665/which-is-the-best-cipher-mode-and-padding-mode-for-aes-encryption   
https://en.wikipedia.org/wiki/Block_cipher_mode_of_operation

####  ECB (Electronic codebook) nije siguran nikako (Adobe passwords leak).  
Može se skontat pattern između plain i cipher (vidi se pingvin, sa linka gore)...   
Koristi mapiranje između bloka i ciphera, pa se uvijek isto dobije.... wack

#### CBC (Cipher Block Chaining)  
Ovaj algoritam uzima cipher PRETHODNOG bloka kao INPUT trenutnog ciphera.  
Pošto *prvi blok nema prethodni ciphertext*, mora se dati neki *random initial value* IV (kao seed neki).  
Ovaj Random IV garantuje da neće bit isti ciphertext za 2 ISTA BLOKA.  
Dekripcija mora *znati IV vrijednost*, i ona se šalje skupa sa ciphertextom.

Ako je plaintext duži/kraći koristi se:
- padding mode, dopunjavanje na 16.  
Za padding se koriste PKCS#7 i RFC5652 standardi.
- ciphertext stealing mode (ista dužina ciphertexta kao plaina), rijetko se koristi, komplikovan..
- counter CTR mode, pretvori u stream cipher...

---------------------------------------

## Streaming cipher algs
Slično kao kod CBC, štiklaju se jedan za drugim...

---------------------------------------
---------------------------------------
---------------------------------------
# Asimetrična enkripcija
Koriste se privatni i public key(evi).  
Public enkripcija se koristi kod TLS/HTTPS protokola.

### Diffie-Hellman, DH

Key agreement protokol.  
https://en.wikipedia.org/wiki/Diffie%E2%80%93Hellman_key_exchange

Teško je *razmijeniti private key* između 2 učesnika - na siguran način.  
Poslati zapečaćenom poštom? Šapnuti na uho? 

Algoritam ukratko:
- prvo se izaberu public brojevi `p` i `g`.
- učesnici A i B izaberu svoje privatne ključeve `a` i `b`
- učesnik A izračuna svoj public key `A = g^a mod p`
- učesnik B izračuna svoj public key `B = g^b mod p`
- ovi public keyevi se *pošalju jedni drugome* publicly
- privatni DIJELJENI KLJUČ je sada `g^(a*b) = A^b = B^a`, tj. može ga izračunat i jedna i druga strana samostalno

Ovo fercera jer se sve radi `mod p`, pa je lakše stepenovat itd...  
Broj `p` treba bit prost broj takav da je i `(p-1)/2` prost (npr. 23 zadovoljava, ali treba bit puno veći).

Sigurnost se oslanja na teškoću diskretnih logaritama (logaritam mod n).

> "Obični" DH alg. nije siguran protiv man-in-the middle attack.  
> Mora se udrobit još i signature neki za sigurnost protiv toga.

### RSA
Kod RSA svako može poslat enkriptovanu poruku (enc sa public keyem kojeg svi imaju),  
ali je samo 1 učesnik je može dekriptovati, tj. pročitati (sa private key).  
Ova 2 ključa su "keypair".

Njegova otpornost ovisi o djeljivosti brojeva.  
Ako neko skonta kako naći faktore ogromnog broja, razbio je RSA (i još dosta crypto algoritama).

Postoji standard za RSA koji se zove PKCS#1 koji definiše 2 šeme:
- PKCS#1 v1.5 (RSAES-PKCS1-v1_5), starija šema koja ima poznate napade, nije sigurna
- OAEP (RSAES-OAEP), optimizovana šema, ovu treba koristit

### Eliptičke krive, ECC
Nemaju veze sa elipsom.  
Dosta brže od klasičnih DH i RSA.

Koriste se jednačine kao npr `y^2 = x^3– 4x`.  
Za računanje keyeva koriste se operacije nad tačkama te krive (sabiranje, množenje i sl), *modulo neki prosti broj*.

Postoji verzija Diffija koja koristi eliptičke krive, ECDH.  
Umjesto `g` uzima se `G`, koje je ustvari tačka na datoj krivoj.  
Zatim se računa `A = d_a * G` itd....

#### ECDSA
ECDSA je algoritam za računanje digitalnog potipisa (signature).  
Koristi se za BitCoin npr.

------

RSA se koristi "samo" za enkripciju i potpise.  
ECC je **familija algoritama za:
- enkripciju i potpise
- key agreement
- identity-based enkripcija (keyevi bazirani na ličnim podacima, npr emailu)

Postoje NIST preporuke (dizajnirala NSA) za koje krive trebamo koristit.. hmm that smelly smell that smells smelly.  

Anyway, imaju i neke "opensource" krivulje, kao Curve25519 i sl.  
Curve25519 koristi Chrome, Apple, OpenSSH itd.



---------------------------------------
---------------------------------------
---------------------------------------


# TLS (Transport Layer Security)
Preteča TLSa je SSL (Secure Socket Layer) protokol.  
TLS je ono S u HTTPS, kad bude katanac. :D

TLS 1.3 je zadnja verzija, koja je popravila dosta vulnerabilities u starijim verzijama.
TLS je ustvari skup protokola, a ne jedan protokol.  
TLS čuči između TCP i jednog višeg protokola: HTTP ili SMTP npr.  
Tj. on osigurava siguran prenos *preko TCP*.

Štiti/enkriptuje konekciju između klijenta i servera.  
Klijent je bilo ko ko komunicira sa serverom: browser, android telefon, drugi server neki, postman i sl.  
Komunikacija je sigurna, autenticirana, nemodifikovana.. saso mange  

Sprečava man-in-the-middle napade tako što koristi certifikate za servere (i opciono za klijente).


## TLS protokoli
Imaju 2 glavna protokola:
- handshake protokol, za uspostavljanje shareanog private keya (DiffieHelman protokol)
- record protokol, format data paketa koji se šalju

Handshake (rukovanje) inicira klijent.  
Klijent prvo pošalje ClientHello poruku, zajedno sa:
- verzijom TLSa koju podržava
- listom preferiranih ciphera koju hoće da koristi/podržava.  
Server vraća ServerHello poruku, sa odabranom konfiguracijom.  
Kad oba učesnika obrade te poruke, spremni su da razmjenjuju *enkriptovane poruke*.

Poruke su enkriptovane *session keyem* dobijenim iz tog handshake procesa.  
Session key je različit od sesije do sesije, tako da i ako se kompromituje nije velik/trajni problem.  
TLS sesija obično ima timeout od 300 sekundi.


### TLS Certifikati
Ovo je **najbitniji dio** TLS-a.  
Server ima *svoj jedinstveni certifikat*, s kojim *dokazuje klijentu* da je on *fakat taj server* (nešto kao lična karta..).  
To je u suštini **public-key + signature_keya + metapodaci**.

Kad se browser konektuje sa nekom stranicom:
- dobavi njen certifikat
- verifikuje signature
- ako je OK, browser *vjeruje tom serveru* i može nastaviti sa "pričanjem"

Certificate Authority (CA) je public-key **hardkodiran u browser/OS**, kojem "logično" vjerujemo da je sahih.  
To su kao "notari" u realnom svijetu, **njihov pečat je validan**.  
Npr. `example.com` treba TLS certifikat, i jedan taj CA mu udari pečat, tj izda mu certifikat/CIPS/ličnu... :)

Certificate Chain je lanac certifikata koji su validni.  
Npr taj neki krovni CA izda certifikat nekom, i onda on može dalje da udara certifikate koji su "pod njim".


---
OMG, kae security experti misle da su certifikati "broken-by-design", ali nemamo ništa bolje zasad hahahahahahah.  
Msm i ima smisla jer je kao domino efekat, turtles all the way.....  
Ako 1 CA upadne svi certifikati koje je opečatio su nevalidni...... jah

---------------------------------------
---------------------------------------
---------------------------------------

---------------------------------------
---------- OPENSSL playground ---------
---------------------------------------

## PRIVATE KEY
Random key (broj obični..):
```bash
openssl rand -hex 16
```


## PRIVATE AND PUBLIC KEY
openssl genrsa 4096

To je base64 encoded privatni key.  
Koristi se base64 radi lakšeg transporta (tekstualni fajl..).

Sad je fazon kako čuvati sigurnim ovaj key...  
SSH to radi tako što dadnemo password, kojim ga on EKRIPTUJE u fajl.  
Ako neko dođe do našeg fajla, ne može ga koristiti bez passworda, tj. mora ga prvo dekriptovat.

Npr:  
```bash
openssl genrsa -aes128 4096
```






