
# Environment variables


Svaki proces ima svoj skup environment varijabli.  
Proces obično nasljeđuje env vars od svog parenta, procesa koji ga je pokrenuo. 
Naravno, parent može postaviti/izmijeniti env vars za child po potrebi...  
Čim se proces pokrene, njegove envvars se **ne mogu izmijeniti**!

Operativni sistemi sadrže određene specijalne envvars, koje su uvijek dostupne:
- `PATH`: lista foldera gdje CMD/Bash traži executables/aplikacije, **u navedenom redoslijedu**
- `HOME`/`USERPROFILE`: home trenutno logovanog usera
- `TEMP`: folder za temp fajlove
- itd........

Kada pokrenemo CMD, on pokupi ove sistemske envvars.  
Zato kad izmijenimo npr. PATH u "Computer properties"->"Advanced System Settings"->"Environment Variables" **moramo restartovati CMD**!




