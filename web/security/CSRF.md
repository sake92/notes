
https://owasp.org/www-community/attacks/csrf

CSRF == XSRF == Session Riding == One-Click attack

Sa malo social inžinjeringa, napadač može prevariti korisnika date web stranice
da odradi neku *akciju koju nije naumio*.   

Cookies prema `mystore.com` se uvijek automatski šalju.  
Bez obzira *sa koje stranice* taj request dolazi.  
Napadač **ne mora vidjeti cookie/sessionid nikako**, samo napravi request.

Primjeri:
- obični tag (ako je GET):  `<img src="http://mystore.com/buy?item=expensiveThing"/>`
- link da klikneš negdje.. (ako je GET)
- sakrivena forma koja se automatski submita (ako nije GET)

Može li IFRAME pa uzet CSRF token? Ne može jer su iframes baš baš restricted, pogotovo kad je sa druge domene..  
https://stackoverflow.com/questions/38290968/csrf-and-iframes
(ali može Clickjacking lolz)

## CSRF problem/odbrana
Napad je okinuti akciju *u ime usera*.  
Odbrana je kako skontat koji request dolazi sa tvoje stranice/domene, a koji je "hakovan"/napadački/falsifikat.  

Klasična odbrana koristi **CSRF token**.  
Svaka akcija **koja mijenja stanje na serveru** bi trebala ići sa CSRF tokenom!  
Bez tokena napadač ne može skoro ništa.

Druga zaštita je `SameSite` cookie atribut koji kaže browseru da šalje **taj cookie** samo ako je na **istoj domeni**!

Do not use GET requests for state changing operations!

Btw, XSS ti **može uništit neke odbrane od CSRF**.

### CSRF token
Da bi spriječili CSRF napad, možemo poslati jedinstveni CSRF token, koji obično vrijedi koliko i sesija.  
(Ako je per-request onda back dugme ne bi radilo, i napraviš sebi još više problema...)

Flow ide ovako:
1. user dođe na site, izgenerišemo CRSF token i vratimo ga u sesiji ili formi
1. taj token uvijek šaljemo u custom headeru kroz JS code ili hidden form field
1. na serveru provjeravamo jel fakat poslan taj token

CSRF tokens should not be transmitted using cookies.  
Ovdje se misli na token u requestu!

Aside:  
By default, browsers do not allow JS to make cross origin requests with custom headers.

TLDR za obične forme:
- dodat `<input type="hidden" name="csrftoken" value="KbyUmhTLMpYj7CD2di7JKP1P3qmLlkPt" />`

TLDR za AJAX:
- dodat `<meta name="csrf-token" content="{{ csrf_token() }}">` (ili u Cookie/sesiju čak!)
- slat taj token u svakom AJAX requestu u *custom headeru*
- ne storeat CSRF u `cookie`/`localStorage`/`sessionStorage`

https://cheatsheetseries.owasp.org/cheatsheets/Cross-Site_Request_Forgery_Prevention_Cheat_Sheet.html#axios


### Double Submit Cookie

Ovo se koristi u Play Frameworku, i baš je zgoda.

Token se vrati klijentu u Cookie.  
Zatim kad se radi request, taj token će bit i u Cookie a i u headeru/formi.  
Ako ne matchaju onda request ne valja.






