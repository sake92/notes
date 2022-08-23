
# Clickjacking == UI redressing


Attacker loada iframe tvoje stranice, sakrije ga, i natjera usera da
- unese neki tekst, redirecta ga na tvoj iframe
- klikne neko dugme, a ustvari klikne unutar iframea

Ovdje CSRF tokeni **ne pomažu** jer oni "odrade svoj posao kako treba".


## Odbrana

`X-Frame-Options` response header:
- `deny` -> zabranjen `<iframe>` ove stranice
- `sameorigin` -> dozvoljeno samo sa istog origina

Ako sam dobro skonto, sameorigin ima svojih problema.  
Zato je najbolje koristit "deny" na svim stranicama koje su osjetljive.  
Ali npr ako hoćemo embedat neki svg ili slično onda tu ne stavljamo ništa.


