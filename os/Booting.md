
# Booting

Kad se upali kompjuter, sve počinje od neke fiksne adrese:
- loada se BIOS/UEFI iz ROMa u RAM i počne izvršavat
- BIOS/UEFI loada bootloader u RAM
- bootloader loada OS kernel itd.


BIOS - Basic Input Output System

UEFI - Unified Extensible Firmware Interface

Vidimo da BIOS/UEFI mora znati čitati hard-disk/CD/itd.  
Zato se BIOS i zove "basic IO system", zna čitati osnovne stvari.  
OS driveri su puno moćniji (i veći).

## BIOS/UEFI

Kada kupimo kompjuter, na njemu već dođe UEFI ugrađen u hardver (ranije je to bio BIOS).

Prije je BIOS bio u nekom ROM-u (fixna memorija, neprebrisiva), ali danas je obično u flash memoriji (tako da se može izmijenit/flešovat/updateovat).  
UEFI je noviji standard koji pokušava unaprijedit BIOS.

BIOS gleda koji su bootable uređaji dostupni, npr. hard-disk, USB, CD i slično.
Postoji i prioritetna lista, npr. želimo da bootamo sa CD-a ako je dostupan.
Sa boot uređaja se učitava bootloader, koji preuzima dalje kontrolu.  

BIOS ima svoj mali API za čitanje/pisanje sa uređaja, ispis na ekran itd.  
Pozivaju se pomoću (softverskog) interrupta.
Npr.

```
mov ah, 0Eh     # write char in TTY mode
mov al, 'S'     # set character to print
int 10h         # trigger BIOS interrupt for video service
```
će ispisati slovo `S` na ekran.

## Bootloader

BIOS/UEFI loada samo prvi sektor hard-diska u RAM i onda preda kontrolu bootloaderu.
> Veličina sektora na hard-disku 512 bytes

Bootloader moramo napisat u assembleru jer 512 bytes.

### MBR

Prije je prvi sektor na hard-disku/CD sadžao Master Boot Record (MBR), 
koji je 512 bajtova max.
MBR sadrži bootloader i podatke o particijama diska (maksimalno 4).

Bootloader je jedan dio MBR-a (446 bytes).
Ostali bajtovi su za particije diska i signature diska.

Bootloader loada kernel sa diska u RAM.

### GPT
U novije vrijeme umjesto MBR koristi se GUID Partition Table (GPT).
On rješava mnoge nedostatke MBR:
- redundantnost, smanjuje mogućnost greške u MBR bajtovima (slučajni bit flip i sl.)
- limit broja particija više ne postoji (osim na windowsu gdje je 128)
- limit veličine diska od 2TB je sada 18 EB

---
BIOS zna čitati samo MBR, jer je starija tehnologija, normalno.  
IEFI može čitati i MBR i GPT.

Bootloader se mora izvršavati u "real mode" koji je 16-bitni (jer BIOS tako starta kad se upali kompjuter..).  
Iako je processor npr 64-bitni, moramo koristiti 16-bitne feature processora.



---
## Resursi

### 539kernel knjiga
[539kernel.com](https://539kernel.com/book/Chapter_1:_Let's_Start_with_the_Bootloader.html) besplatno online

Koristi NASM za assembler i Bochs za emulator x86 procesora.

### Wikipedia

https://en.wikipedia.org/wiki/BIOS_interrupt_call

https://en.wikipedia.org/wiki/Master_boot_record


https://www.howtogeek.com/193669/whats-the-difference-between-gpt-and-mbr-when-partitioning-a-drive/


