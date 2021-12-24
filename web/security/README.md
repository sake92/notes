
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
- Changed roles, updated profile image -> NO (this is STILL a valid token.. :) )

