
# 12 factor apps

- https://12factor.net
- https://cloud.google.com/architecture/twelve-factor-app-development-on-gcp
- https://www.baeldung.com/spring-boot-12-factor



## Codebase
Use **git**.  
1 repo == 1 app == 1+ deploys.  

Don't share code between apps -> use **libraries** for that.  
(I guess this applies to git submodules especially, they're a nightmare)


## Dependencies
Declare them **explicitly** in your `pom.xml`, `package.json` or whatever.  
Don't rely on packages that are globally installed on a machine.

As usual, **less dependencies** the better.


## Config
Separate config from code!  
Don't use `application-{env}.config` props files (unless for local dev maybe).  
Use **environment variables** to configure your app!

This is the stuff that varies between deployment environments.  
It is especially important for credentials.  
> If you can **open source it as is**, it is a good 12 factor app!

---
I guess that you will not extract *everything* into env vars, that would be crazy.  
Only the stuff that's *really important* and different from env to env.  
For example you won't necessarily extract "max-threads" or similar, but you will extract URLs to external services and passwords...

[Spring](https://docs.spring.io/spring-boot/docs/1.5.6.RELEASE/reference/html/boot-features-external-config.html#boot-features-external-config-application-property-files)
has a nice feature where you can pass the stuff from `application.properties` as an env var.  
For example if you have a property `a.b.c` you can pass it a an env var called `A_B_C`.

In [Play/Hocon](https://github.com/lightbend/config#optional-system-or-env-variable-overrides) you can do the same thing.


## Backing services

12FA makes no distinction between local and third party services.  
Use URLs/locators for both.  
**No need to re-build your whole app** just because one service URL has been changed!


## Build -> release -> run

Build step just **builds your app executable** (e.g. a JAR, or a docker image).  
A release **adds config to that executable** (e.g a jenkins job with env vars, or docker-compose, or kubernetes).  
The run step **runs** your app (e.g. on EC2 instance).

Any change must create a new release.  
This way it is trivial to do a rollback for example!  
You know what build you used *and the config for it*!


## Processes
12-factor processes are **stateless and share-nothing**.  
Any data that needs to persist must be stored in a **stateful backing service**, typically a **database**.

Don't use in-memory (sticky) sessions!  
Use Redis or similar.


## Port binding

12-factor app is completely **self-contained**, it has its own port.

So, forget about Apache server, Tomacat EE and similar!


## Concurrency
Scale out horizontally, by having multiple instances/processes of your app.  
\# kubernetes ! :D

Having your app stateless helps a lot! :)


## Disposability

Maximize robustness with **fast startup and graceful shutdown**.


## Dev/prod parity

Keep development, staging, and production as similar as possible.

The twelve-factor developer *resists the urge to use different backing services between development and production*.  
Sooo, [TestContainers](https://www.testcontainers.org/)!


## Logs
Treat logs as event streams.  
Logs have no fixed beginning or end, but **flow continuously** as long as the app is operating.

A 12FA never concerns itself with routing or storage of its output stream. It **should not attempt to write to or manage logfiles**.  
Instead, each running process writes its event stream, unbuffered, to **stdout**.

\# Kibana # datadog ...


## Admin processes

Run admin/management tasks as **one-off processes**.

Admin code must ship with application code to **avoid synchronization issues**.  
E.g. if you run db migrations separately, you should ship them in your release...









