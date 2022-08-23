

# Same Origin policy


origin: protokol + domena + port  
Npr. https://example.com:8081

Ako je http to nije isti origin !!!!

Zato se CORS trigeruje kad probamo AJAXom pristupit drugom originu.  
Ako baš baš želimo dozvolit tom drugom originu da pristupi možemo **eksplicitno dodat**:  
`Access-Control-Allow-Origin: https://drugi_origin.com`.

## Analogija

Ako je web OS, onda je origin kao proces a browser kao kernel.  
Procesi se ne smiju miješat, čitat memoriju jedni drugima i sl.


## Izuzeci

- loadanje slike, OK
- loadanje CSS, OK
- loadanje skripte, hmmmmm
- submitanje forme, WTF





