
Da ne kucate sve ovo dole, možete pokrenuti skriptu:
```bash
./run.sh
```

## Asembler
```bash
as -o bla.o bla.s
```


## Loader
Adrese u "objektnom kodu" su RELATIVNE.  
Loader ih popuni pravim, fizičkim adresama.

```bash
ld -o bla bla.o
```

## Exit status
```bash
echo $?
```




