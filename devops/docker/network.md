
## User defined network
Kuca se `docker network create my-net`

On a user-defined bridge network, containers can resolve each other by name or alias.  
Npr pokrenes bazu sa `--name my-db` i mozes se konektovat na nju preko `jdbc:mysql:my-db` (iz Dokera samog! ne izvana sa hosta).  
Za dijeljenje podataka/konfiguracija/varijabli može se mountat zajednički volume npr.

https://stackoverflow.com/questions/55003036/accesing-another-service-using-its-url-from-inside-the-docker-compose-network

Prije se koristio `--link` fazon, ali se on mora napravit za OBA DOKERA, pa je naporno.

## Default bridge network

Docker kontejneri "žive u svom svijetu", po defaultu.  
Imaju svoju malu virtuelnu mrežu, svaki ima svoju IP adresu...

Unless you `docker run --network="host"`!

https://stackoverflow.com/questions/24319662/from-inside-of-a-docker-container-how-do-i-connect-to-the-localhost-of-the-mach




Containers on the *default bridge network* can only access each other by IP addresses.
Configuring the default bridge network happens outside of Docker itself, and **requires a restart of Docker**.

















