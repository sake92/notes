
Pošto k8s zahtijeva puuuuuuuuno YAML fajlova da se iskonfiguriše sve:
- servisi
- volumes
- deployments
- ingress
- itdddddddddddddd

tu je Helm fazon da pomogne!  
On u suštini zapakuje grupu YAML fajlova koji su logički povezani.  
Također ima i templating mogućnosti: jedan fajl -> više environmenta.

Ima i svoj registry pa se može koristit i kao npm/maven/dockerhub!!!  
Mogu se override samo određeni propertyji, npr password za mysql...

Koncepti:
- chart -> bundle YAML fajlova, definicija servisa/aplikacija/baze..
- repo -> repozitorij chartova
- release -> instanca charta deployaTa na k8su


## Usage

Instalacija WP na k8s (novi release):
```sh
helm install happy-panda bitnami/wordpress
```
Dali smo ime releasea `happy-panda`.  
Koristi se `helm list` za listu releasa.

Ako hoćemo automatski da dodijeli naziv releasu, ide `--generate-name`.  


---
Helm submita k8su šta treba odradit i odma izađe.  
Za provjeru statusa `helm status happy-panda`

---
Helm deploya chart *sa defaultnim vrijednostima*.  
Ako želimo vidjet šta možemo tweakat: `helm show values bitnami/wordpress`.

Zatim napravimo fajl `values.yaml`:
```
{
  mariadb.auth.database: user0db,
  mariadb.auth.username: user0
}
```
i zatim
```sh
helm install -f values.yaml bitnami/wordpress --generate-name
```


### Update
Kad izmijenimo config/verziju:
```sh
helm upgrade
```

Helm updatea minimum stvari na k8s da bi postigao *željeni config/status*.

Možemo i rollback ako smo šta zeznuli: `helm rollback happy-panda 1`.  
Ovo bi vratilo na prvi release.  
Kucamo `helm history happy-panda` za listu revizija/verzija..



### Create chart

https://docs.bitnami.com/tutorials/create-your-first-helm-chart/

```sh
helm create bla
helm package bla
helm install bla ./bla-0.1.0.tgz
```


U folderu gdje je Chart:
```sh
helm dependency update
helm install --dry-run --debug my-service-name .
```


