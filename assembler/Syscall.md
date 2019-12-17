


Procesori obično imaju "user-mode" i "privileged-mode" (kernel-mode, supervisor-mode).  
Da bi se odradili neki specijalni zadaci, tipa: čitanje/upis fajla, print na ekran i sl. moramo biti u tom specijalnom, zaštićenom kernel modu.  
Eh, sad, operativni sistem tj. njegov kernel/duša ne dozvoljava tek tako korisničkim programima da ulaze u taj mode.  
Korisnički programi moraju da odrade tzv. "system call" za akcije koje zahtijevaju kernel-mode.  
Svaki od tih sistemskih poziva ima svoj jedinstveni ID.  
Npr. `printf("hello, world!\n");` poziva stdlib-ov wrapper  
`write(1, "hello, world!\n", 14);` koji u pozadini odradi  
`syscall(SYS_write, 1, "hello, world!\n", 14);`

Slično je za `fopen`, `malloc`, `free` itd.

## Errors
Kad failaju sistemski pozivi, obično vrate vrijednost `-1`.  
Također, vrijednost greške se postavi u globalni `errno` fleg, ali kao **pozitivna vrijednost**!

Vrijednost `errno` se **ne resetuje** pri uspješnom pozivu, već ostaje nepromijenjenooo!!!



