

930275aa-e4f6-4aff-8d3c-f0722975470c


https://www.youtube.com/watch?v=2PPSXonhIck

# Keycloak


Keycloak je Authorization server.  
Koristi OpenID protokol za autentikaciju+autorizaciju.  
OpenID je ustvari **nadogradnja na OAuth2**! (u pozadini se koristi OAuth2)


Useri dobiju fin dashboard za promjenu passworda, 2FA itd.

## Realm
Realm je "stvarnost", svijet za sebe.  
Npr. ako imaš poseban deployment za dev/staging/klijent_maksuz_tražio to je jedan realm.



## Role
Rola može biti grantovana (data) useru direktno ili cijeloj grupi.  
Role mogu biti globalne ili po aplikaciji.  
Role se mogu i compozati, ugniježdavati, nasljeđivati....


## Group
Možemo staviti usere u "grupe", user *nasljeđuje sve atribute grupe*.  
Grupa je skroooooooooooz slična roli...  

Zgodno je imati grupu "employees" npr i dodijelit/uzeti im određene role...
https://stackoverflow.com/questions/58011950/keycloak-user-registration-how-to-add-the-role
Vako možemo dodat usera u grupu ČIM SE REGISTRUJE, a samim tim će imat i defaultne role.. :)


### Logout

- oslanjanje na kratko trajanje tokena
- backchannel za server-side apps, napraviš callback/webhook za logout evente (jer se user logouta preko Keycloaka)

### Audience
Pošto se user loguje i dobije access_token, nije baš fino da svi serveri vide sve role/privilegije tog usera.  
Za to služi "aud" u tokenu, kaže koji resource-servers mogu čitati taj token.

Moraš reć `"verify-token-audience": true` na serveru.


### Scope
Useri imaju ROLE, a klijenti imaju SCOPES, kao "pogled na role"...  
Tj. lista "mogućih rola" koje ovaj klijent "vidi".

Primjeri (za albums servis npr):
albums:view
albums:create
albums:delete


## Verifikacija JWT tokena
Možemo verifikovat JWT na 2 načina:
- token introspection endpoint, pingamo Keycloak
- ručno ili sa libraryjem, tu nam treba private key kojim je enkodiran token


-----------------
# Tipovi web aplikacija
- SPA
- bekend za SPA ili all-in-one PHP/Spring/whatever ili "gateway"
- bekend iza gatewaya, treba nam samo JWT


### SPA
Kad imaš SPA, prilikom logina se radi **puni redirect na Keycloak**,  
i preko `authorization_code` se odradi login/autorizacija, te Keycloak redirecta nazad na SPA.  

TODO ne znam jel baš ovako ide... :/

Zatim taj code **bekend** pošalje Keycloaku, koji nam vrati `access_token`+`refresh_token`+`id_token`.  
To se sve čuva u SESIJIIIIIIIIIIIIIIIIIIII, koja je uspostavljena sa SPA! :)

Backend *prilikom starupta/povremeno* povuče *public* encryption keys kojima validira te JWTs.  
Pritom nema potrebe uopće da poziva Keycloak, bude stateless. #stonks

Id token su ustvari *podaci o useru*.  
U OpenID ovi tokeni su "providni", možemo ih raspakovati i vidjeti na frontendu!!!




----- TODO delete?
I backend naš također koristi Keycloak.  
Frontend mu šalje `Bearer access_token`, koji backend validira je li autentičan.  











