

https://www.youtube.com/watch?v=X48VuDVv0do

## Orkestracija

# Pod
pod == (docker) container
node == (physical) server

Pods should be stateless, so that we can restart them easily.  
Any data that should survive a restart should be written to a volume/redis/db/s3/whatever.

Each pod has its own (internal) IP address.  
If it gets restarted, it will get a NEW IP.

## Deployment
Deployment is a *description* of how a pod *should be run*.  
So you just specify how "a pod" would look like, and leave the scaling/replicas part to k8s.

## StatafulSet
Same as Deployment but for databases and stateful stuff.

---------
# Service
Thus -> services (discovery)!
You could have "my-service" name and your HTTP request would get routed to *one of the pods* under that service.  
So services do *load balancing* for us!

Types:
- internal, databases and similar
- external, APIs that are public



# Ingress
Gateway....


# ConfigMap && Secret
Configuration server, similar to Spring Cloud Config...

Secret holds pwds..



# Volume
Mutable, persistent data.  
It is EXTERNAL to k8s, it doesnt take care of it !!!







