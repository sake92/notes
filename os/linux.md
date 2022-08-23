


## Run in BG

nohup ...

iliiiiiii boljeee  
`sudo -b ./skripta.sh`


### Java...
`jps -m` da izlista sve Java procese koje sam ja pokrenuo..

## TTY teletype/teleprinter
http://www.linusakesson.net/programming/tty/index.php

Prije (1800-te) su bili električni teletype uređaji, kao kucaća mašina.  
Na drugom kraju, kilometrima daleko, tekst koji kucaš bi se printao na papiru.

Kad su se pojavili kompjuteri, počeli su se ti teletype koristit i za kompjutere!  
Papir je zamijenjen ekranom.  
Ali trebao je neki driver/adapter softver za njih.  
U Linuxu je bio VT-100 Video Terminal unutar kernela.  
Istoimeni uređaj: https://upload.wikimedia.org/wikipedia/commons/9/99/DEC_VT100_terminal.jpg

Mogao se je pomjerati kursor, blinkanje, boje i ostalo..  
Teletype uređaji više ne postoje (hvala Bogu).


TTY (TTY device) je tuple3 koji se sastoji iz:  
UART uređaj (tastatura obično) + TTY driver + line discipline programčić.


