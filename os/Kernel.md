
# Kernel
Kernel je srce OS-a. On se izvršava u privileged modu, to se seta na samom CPU sa nekom instrukcijom.  
Procesi koji su "obični smrtnici", u tzv user modu se izvršavaju u "normalnom" modu CPU-a.  
User-mode procesi moraju ići preko kernela kada žele da:
- ispisuju na ekran
- čitaju sa tastature i uređaja
- čitaju/pišu fajlove sa hard-diska
- čitaju/pišu sa mreže

To rade preko sistemskih poziva, syscall.  
Syscalls su C library koje OS providea, npr libc na *nix sistemima.


