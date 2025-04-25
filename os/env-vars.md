
# Environment variables


Svaki proces ima svoj skup environment varijabli.  
Proces obično nasljeđuje env vars od svog parent procesa, procesa koji ga je pokrenuo. 
Naravno, parent može postaviti/izmijeniti env vars za child po potrebi...  
Čim se proces pokrene, njegove envvars se **ne mogu izmijeniti**!

Operativni sistemi sadrže određene specijalne envvars, koje su uvijek dostupne:
- `PATH`: lista foldera gdje CMD/Bash traži executables/aplikacije, **u navedenom redoslijedu**
- `HOME`/`USERPROFILE`: home trenutno logovanog usera
- `TEMP`: folder za temp fajlove
- itd........

Kada pokrenemo CMD, on pokupi ove sistemske envvars.  
Zato kad izmijenimo npr. PATH u "Computer properties"->"Advanced System Settings"->"Environment Variables" **moramo restartovati CMD**!

Na Windowsu envvars se postavljaju sa `set NAZIV_VARIJABLE=VRIJEDNOST`.  
Da bismo koristili neku drugu varijablu koristimo `%var%`.  
Npr ako imamo `JAVA_HOME=C:\Java\jdk1.8` i želimo da dodamo njen `bin` folder u PATH, to možemo uraditi ovako:
`set PATH=%JAVA_HOME%\bin;%PATH%`  
Provjera `echo %PATH%`.  
Naravno, ova vrijednost PATHa vrijedi samo dok nam je pokrenut CMD!


### JAVA_HOME
Dosta Java alata/aplikacija se oslanja na postojanje varijable `JAVA_HOME` ili `JDK_HOME`.  
Preferira se `JAVA_HOME` obično...  
Ako otvorite npr `mvn.cmd` od Mavena ili `catalina.bat` od Tomcata, vidjećete da koriste te varijable.  
Npr. ako imate postavljenu Javu 1.8 i želite da probate Tomcat na Javi 11, možete:
- update PATH u Comp props i onda će vam globalno biti Java 11. Tako rizikujete da vam neće radit neki alati, jer ih je dosta "zaglavilo" na javi 8
- ufiksate u skripti `JAVA_HOME=C:\Java11`
- postavite u CMD  `JAVA_HOME=C:\Java11` i onda vrijedi samo u toku te "sesije", dok ne zatvorite taj CMD prozor.  
Tomcat će "vidjeti tu vrijednost" zato što je on **child proces od CMD-a** !

