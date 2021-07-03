

https://www.youtube.com/watch?v=X48VuDVv0do

# Pod
pod == (docker) container(s)  
node == (physical) server

Pods should be **stateless**, so that we can restart/replace them easily.  
Any data that should survive a restart should be written to a **volume**/redis/db/s3/whatever.

Each pod has its own, cluster-internal IP address.  
If it gets restarted, it will get a NEW IP.

## Deployment
Deployment is a *description* of how a pod *should be run*.  
So you just specify how "a pod" would look like, and leave the scaling/replicas part to k8s.

## StatafulSet
Same as Deployment but for databases and stateful stuff.

Imaju *identitet*, nisu interchangeable, teže je reschedulat...  
Tj. master/slave/replike itd...

*Nije preporučeno* koristit ovo, lakše je pješke namjestit klaster Postgresa... :D

---------
# Service
Thus -> services (discovery)!
You could have "my-service" name and your HTTP request would get routed to *one of the pods* under that service.  
So services do *load balancing* for us!

Types:
- internal, databases and similar
- external, APIs that are public

Types:
- ClusterIP -> IP adresa + port dostupni samo UNUTAR CLUSTERA
- NodePort -> dostupan IZVAN CLUSTERA, preko IP adrese NODEa na kojem runna svaki POD ovog servisa  
  NOT RECOMMENDED
- LoadBalancer -> dostupan kroz CLOUD PROVIDERov GATEWAY


# Ingress
Gateway....


# ConfigMap && Secret
Configuration server, similar to Spring Cloud Config...

Secret holds pwds..



# Volume
Mutable, persistent data.  
It is EXTERNAL to k8s, it doesnt take care of it !!!

Moraju se Volume Claims pravit za svaki namespace,
a Volume se konfiguriše zasebno.  
Npr. k8s admin iskonfiguriše volume koji koristi aws storage,
a dev/devops napravi Claim za 10GB i stora podatke *preko tog claima*...  
Indirections, indirections everywhere...

But that's not all, ima i StorageClass, koji dinamički?? kreira volumes? :o


# Namespace
Logičko grupisanje komponenti.  
Npr. namespace za Authorization server u kom ima njegov app, MySQL i Elastic koje koristi..

Neke komponente možeš reusat, tj. referencirat iz drugih namespacea.  
Npr. shareaš auth server, logging infra itd.

Volumei su globalni. Ne mogu bit per-namespace.




