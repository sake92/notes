
https://github.com/wsargent/docker-cheat-sheet

Na Windowsu umjesto singlequoute (') koristi doublequotes (")...

Image je kao EXECUTABLE/klasa, kod spreman za izvršavanje.  
Container je kao PROCES/objekat, jedna instanca image-a.

Probati `docker run hello-world` čisto da znamo da fercera..  

- `docker image ls` da izlista sve **image**.
- `docker ps` da izlista sve **pokrenute containere** (`-a` da izlista i ugašene).

Dockerfile defines what goes on in the environment inside your container.  


Uvijek ide SOURCE -> DESTINATION, tj. HOST->DOCKER!  
Npr. kod portova je `8081:80` mapira host port 8081 na port 80 iz dokera...  
Isto tako `COPY src bla` kopira src iz hosta u folder bla iz dokera.


## Run
`docker run -p 4000:80 friendlyhello`

## Stop container
`docker stop friendlyhello` ili  
`docker stop tet354eg4535`

## Start stopped container 
`docker start friendlyhello`

## Delete image
docker image rm tet354eg4535


## Container info

`docker logs tet354eg4535`
`docker inspect tet354eg4535`  

- `docker top`    ->  show running processes in container
- `docker stats`  ->  show containers' resource usage statistics
- `docker exec`   ->  execute a command in container
  `docker exec -it f9b299fca359 /bin/bash` (da "uđeš" u container)
  `-i` je "interactive"
  `-t` je "terminal/TTY"
- `docker rm f9b299fca359` -> obriši kontejner

## Stop all containers
docker stop $(docker ps -aq)


## Buildanje image
`docker build --tag=friendlyhello .`
Image je izbildan u lokalni image repo.

## Docker file system
https://www.ionos.com/community/server-cloud-infrastructure/docker/understanding-and-managing-docker-container-volumes/

Doker image sadrži read-only FS.  
Kad se instancira container, napravi se read-write FS, sa svim fajlovima iz RO-FS kopiranim.  
Čim se ubije container, ubije se i taj RW-FS, zgodno pravo.

E sad, da ne bi stalno rekreirali te fajlove, koristimo tzv. VOLUMEs.  
Volume-i prežive između rekreiranja containera.  
Pomoću njih naš host može komunicirati sa containerom, dijeliti fajlove.  
Također, i containeri između sebe dijele volume.  
Zgodno je za čuvanje podataka iz baze i sl.

Kreiranje volume:
`docker volume create --name my-volume`  
Ovaj volume će bit kreiran negdje tamo.. kucaj `docker volume inspect my-volume`

Pokretanje containera sa namapiranim volume:
`docker run -it --name my-volume-test -v my-volume:/data`  
Ovako će container vidjeti u svom folderu `/data` sadržaj volumea `my-volume`.

### Bind Mount
Ovo je zgodno da nabrzakE testiraš nešto zDokerom.  
Namapiraš explicitno folder sa hosta na Dokerov folder.  
Ovo nije dobro jer se ne možeš oslonit da će svaki user imat taj folder spreman.. baš za ovaj naš docker container i tako to...  
Plus ne može se koristit u Dockerfile tek tako.









### Misc

Default ENTRYPOINT je `/bin/sh -c`.  
CMD su argumenti za ENTRYPOINT...

Default USER je root.
