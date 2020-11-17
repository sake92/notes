

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







## Performance tuning
There are 2 modes: BIO and NIO. 

NIO/NIO2 is used by default in Tomcat 8+.  
It is more performant and can handle much more connections.

BIO is blocking, thread per request model. If you want to handle 100 requests at once you have to use 100 threads.
In bio maxConnections==maxThreads unless you use a thread pool. E.g. <Executor name="tomcatThreadPool" ...


https://stackoverflow.com/questions/24678661/tomcat-maxthreads-vs-maxconnections

PROBLEM: j.n.s.SSLException: handshake timed out	
Morebit da OS odbija TPC konekcije jer mu je Tomcat REKAO!!
The `acceptCount` parameter for tomcat dictates the length of the queues at the OS level for completing tcp handshake operations (details are OS specific).
https://netflixtechblog.com/tuning-tomcat-for-a-high-throughput-fail-fast-system-e4d7b2fc163f
Znači kad povećaš broj threadova nije loše i to povećat...

