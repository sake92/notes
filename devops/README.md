


1. Terraform:
    - infrastructure as code
    - nakucaš šta ti sve treba na AWS i/ili ostalim providerima: serveri, mreže, firewalli, servisi itd
    - terraform ti to kreira
    - vrlo lahko kreiraš NOVI ENVIRONMENT: dev, staging, prod, test...
1. Ansible (opcionalno)
    - kad terraform napravi infrastructuru, sa ansible ju možemo iskonfigurisati
1. Kubernetes (k8s)
    - može terraform kreirat ga npr
    - preko kubernetesa hendlamo/deployamo/scaleamo NAŠE (mikro)SERVISE
1. Docker
    - napravimo image našeg servisa
    - deployamo 1+ kontejnera (instanci image-a)
1. Docker compose (opcionalno)
    - nije loše za lokalni development
    - mada ima i minikube (lokalni k8s)
    


## Secrets

- pokreneš terraform za Vault (koristiš aws_access+aws_secret setan u Bashu..)
- DODAŠ potrebne secrete u Vault, npr amazon aws_secret itd
- iz SVIH SLJEDEĆIH terraform configa KORISTIŠ TE SECRETE !!! :)

Ako treba copy ima Consul snapshot fazon.





