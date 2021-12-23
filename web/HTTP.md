
wow, ok, wtf  
https://www.youtube.com/watch?v=oDkg1zz6xlw  
https://www.shodan.io



## DNS fazoni
Kad ukucaš `sake.ba` tvoj ruter ima *defaultni gateway*, to je prvi ruter na koji je nakačen konfjuter.  
Zatim taj ruter pinga DNS od ISP (bhtelecom, logosoft..) i on onda idući DNS koji je odgovoran,  
sve dok ne stigne do DNSa koji ZNA IP ADRESU na kojoj je ta stranica.

- `ipconfig`/`ifconfig` - lokalne IP adrese
- `ping sake.ba` - vidi je li taj host dostupan ikako, preko ICMP protokola
- `nslookup sake.ba` - daj mi IP adresu ove domene
- `tracert sake.ba`/`traceroute sake.ba` - tracea request, isprati sve "hopove"/rutere na putu do te domene

Možeš i *overrideat DNS resolvanje* u etc/hosts npr.



## koji HTTP STATUS vratit?  
https://stackoverflow.com/questions/942951/rest-api-error-return-good-practices


*************************
GET		-	dobavi resurs! vraća headere i body (obično), kešira  
HEAD	-	vraća iste headere kao i GET, nema body

PUT		-	stavi RESURS na TAČNO OVAJ URL!!! ne mora vraćat body  
POST	-	evo ti ovaj BODY i uradi nešto s njim (šta bilo)

TRACE	-	isprati put REQUESTA i javi mi rezultate (proxy serveri i to...)

****************************
PUT je idempotentna metoda kao i GET, POST nije.  
Idempotentno znači da kad ponoviš isti request zaredom više puta,
to je kao da si okinuo ga samo jednom. 

Ako si u nedoumici, koristi POST

*****************

URL hostname, npr www.sake.ba je CASE-INSENSITIVE. Može biti samo jedna domena s tim imenom.  
Ostatak URLa, naime PATH i QUERY bi trebali bit CASE-SENSITIVE!!! /bla != /BLA != /Bla ...



## Virtual hosting
Virtual hosting znači više web stranica na istom hostu/serveru, npr sake.ba i kicin.ba  
To znači da obe imaju ISTU IP ADRESU!!! :O
I npr. browser kae `GET /index.html`, kako server zna koju stranicu da hosta?  
Pa `Host` header, naravno. Probaj iz CURL/Postmana!!! U njeg se metne koju stranicu šicaš.  
Ako server nije virtuelni, može ignorisat taj header.

Host 		- koji server pozivaš, mora se koristit U SVIM REQUESTIMA PREMA VIRTUELNIM SERVERIMA!!!
Referer 	- odakle dolaziš, s koje stranice, ko te poslo


## bla.com vs bla.com/
Generalno/tehnički su RAZLIČITI URL-ovi.  
https://webmasters.googleblog.com/2010/04/to-slash-or-not-to-slash.html



***************
Tipovi autentikacije:
### Basic Auth
Izbaci ti popup da se loguješ, user/pass i logovan si.  
Svaki idući request browser šalje header
	`Authorization: Basic dXNlcjpwYXNzd29yZA==`
koji predstavlja base64-enkodiran user:pass.  
Problemi	=> mora se koristiti HTTPS jer se SVE VIDIIII :D 
			=> CSRF takoðer
### Form based Auth
Napraviš svoju custom formu, i preko nje se user loguje.  
Isto sranje - drugo pakovanje.  
Header:	`"Content-Type" : "application/x-www-form-urlencoded"`  
Body je username i password, naravno.


************************
if you have binary (non-alphanumeric) data (or a significantly sized payload) to transmit, 
use multipart/form-data. 
Otherwise, use application/x-www-form-urlencoded.
http://stackoverflow.com/questions/4007969/application-x-www-form-urlencoded-or-multipart-form-data







