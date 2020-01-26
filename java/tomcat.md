

## Jave EE folderska struktura

```bash
index.html (ili index.jsp možda)
/META-INF
   Standard jar gibberish like manifest.mf
/WEB-INF
  web.xml
  /classes
    /com... (app code)
  /lib (dependency JARs)
```
Znači HTML/JSPs/JSFs, CSS, JS, slike mogu biti u bilo kom folderu **osim `META-INF` ili `WEB-INF`**!  
Oni su posebni, nisu dostupni preko HTTP.  
Npr u webinfu se stavljaju konfiguracije, passwordi itd..

Međutim! :D većina ljudi stavlja JPSs u webinf, jer sigurnije kao.
https://stackoverflow.com/questions/6825907/why-put-jsp-in-web-inf

## Hosts, server.xml

U fajlu `conf/server.xml` postavljamo glavne postavke Tomcata.  
Tomcat može služiti više Virtuelnih hostova. Po defaultu ima samo localhost iskofigurisan.  
Ali npr. možemo hostati 2 ili više domena sa istog servera!

Obično je setovano `autoDeploy="true"` tako da čim kopiramo WAR u `/webapp` folder, Tomcat ga skonta,
raspakuje i deploya.  
Treba metnut na false kad bude u produkciji i **ručno unijeti** `<Context docBase="my-webapp" path="/my-webapp"/>` pod `<Host>`-om. :)

Root servera se deploya u `ROOT` folder.  
Ili u server.xml metnemo `<Context .. path=""/>`

## Multiple servers
Glavne env varijable:

- CATALINA_HOME folder gdje je Tomcat raspakovan
- CATALINA_BASE folder gdje su config, WARovi itd :)  
 Korisno kada imamo više sajtova. Za svaki imamo skriptu koja setuje ovu varijablu i pokrene Tomcat)

Nije baš trivijalno skontat šta ide u "home" a šta u "base".  
Međutim ima uputstvo u "RUNNING.txt" u Tomcat folderu!!! 








