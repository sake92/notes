
Sva dešavanja u CPU se dešavaju pod kontrolom clock signala (takt, pravougaoni signal).
Jedan clock/takt trajanja T sadrži T/2 pozitivnog signala (npr. +5V) i T/2 nultog signala (1 i 0).
Jedna instrukcija/naredba traje 1 ili više taktova.

CPU po defaultu čita i izvršava instrukcije **sekvencijalno**, od 0,1,2 pa nadalje.
Ovaj ciklus se odvija do beskonačnosti (sve dok je kompjuter upaljen) i naziva s **fetch-execute** ciklus.
Za "brojanje instrukcija" se koristi PC (Program Counter).  
Tu se drži *adresa* iduće instrukcije.

Naravno, bilo bi glupo kada bi CPU izvršavala instrukcije **samo sekvencijalno**.
Trebaju nam i pozivi funkcija, if-uslovi (grananje), petlje i sl.
Za ovo se koristi JMP/GOTO (jump - skoči bezuslovno) instrukcija, koja postavlja PC na neku vrijednost.
Osim JMP imamo u JEQ (jump if equal, skoči pod nekim uslovom) koja postavlja PC **ako je uslov ispunjen**, 
  tj. simulira `if (condition) abc`.

## Opcode
Svaka instrukcija ima svoj opcode (operation code). 
To je obično redni broj instrukcije (dizajner CPU to određuje).
CPU ga koristi da "skonta" šta treba da odradi.
Obično se za ovo koristi dekoder, ulaz je opcode, a na izlazu se odrađuju potrebne akcije (nešto kao switch-case..).

Npr. ako imamo ADD i ADDI (add immediate, sabiranje sa konstantom), ADD gleda u registre ili memoriju,
a ADDI "zna" da je drugi operand konstanta i to je to. :)

LOAD učitava vrijednost iz memorije u registar.
STORE sprema vrijednost iz registra u memoriju.

## Interrupt
Interrupt je kao poziv funkcije, nije neki "error handler" već normalna i očekivana procedura. 
Postoji minimum jedan **interrupt pin** na CPU (više je ako ima mogućnost hardverskog prioritiziranja).
Kad se desi neki interrupt, CPU efektivno skače na adresu/funkciju koja je dužna da ga obradi.
Npr. interrupt za unos sa tastature, CPU dobije i spremi vrijednost trenutne tipke/tipki negdje u memoriju...

## Booting
Kad se upali kompjuter, sve počinje od neke fiksne adrese, loada se BIOS, bootloader itd.
Prije je BIOS kod bio u nekom ROM-u (fixna memorija, neprebrisiva), ali je danas obično u flash memoriji (tako da se može izmijenit/flešovat). ;)
UEFI je new kid on the block, koji pokušava unaprijedit BIOS.

BIOS gleda koji bootable uređaji su dostupni, npr. hard-disk, CD i slično.
Postoji i prioritetna lista, npr. želimo da bootamo sa CD-a ako je dostupan.
Sa boot uređaja se učitava bootloader, koji preuzima dalje kontrolu.

## CPU je "centar svijeta"
Ako se nekad zapitate, LOAD, gdje? Pa u CPU/registar, sve se gleda u odnosu na CPU.
