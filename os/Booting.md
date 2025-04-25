# Booting

Kad se upali kompjuter, sve počinje od neke fiksne adrese:
- loada se BIOS iz ROMa u ROM i počne izvršavat
- BIOS loada bootloader
- bootloader loada OS kernel itd.

Prije je BIOS bio u nekom ROM-u (fixna memorija, neprebrisiva), ali danas je obično u flash memoriji (tako da se može izmijenit/flešovat/updateovat).  
UEFI je new kid on the block, koji pokušava unaprijedit BIOS.

BIOS gleda koji su bootable uređaji dostupni, npr. hard-disk, USB, CD i slično.
Postoji i prioritetna lista, npr. želimo da bootamo sa CD-a ako je dostupan.
Sa boot uređaja se učitava bootloader, koji preuzima dalje kontrolu.  

## Bootloader
Bootloader mora biti 512 bajtova max ???
