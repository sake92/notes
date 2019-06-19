
## User defined network
Kuca se `docker network create my-net`

On a user-defined bridge network, containers can resolve each other by name or alias.  
Npr pokrenes bazu sa `--name my-db` i mozes se konektovat na nju preko `jdbc:mysql:my-db` (iz Dokera samog! ne izvana sa hosta).  
Za dijeljenje podataka/konfiguracija/varijabli može se mountat zajednički volume npr.

Prije se koristio `--link` fazon, ali se on mora napravit za OBA DOKERA, pa je naporno.

## Default bridge network
Containers on the *default bridge network* can only access each other by IP addresses.
Configuring the default bridge network happens outside of Docker itself, and **requires a restart of Docker**.


















