# OPA

Unifies policy enforcement across the stack.  
Has a high-level **declarative language** that lets you specify policy as code 
  and simple APIs to **offload policy decision-making from your software**.  
You can use OPA to enforce policies in microservices, Kubernetes, CI/CD pipelines, API gateways, and more.

Based on v0.43.0
https://www.openpolicyagent.org/docs/latest/  
https://medium.com/@mathurvarun98/how-to-write-great-rego-policies-dc6117679c9f


## How it works
OPA has a REST interface which is queried by various components.  
For example, your microservice can query OPA with some *input data* (usually in JSON format),  
and decide whether to authorize a user or not.

OPA is used only for **decision-making**, NOT for enforcement!  
That is the job of each service by themself.

![](https://d33wubrfki0l68.cloudfront.net/b394f524e15a67457b85fdfeed02ff3f2764eb9e/6ac2b/docs/latest/images/opa-service.svg)


OPA response is usually a yes/no (boolean).  
But it can also be a list of permitted IP addresses, object with stuff_ids etc, **any structured data**.

# Installation

```bash
# mac
curl -L -o opa https://openpolicyagent.org/downloads/v0.43.0/opa_darwin_amd64
chmod 755 ./opa
# linux
curl -L -o opa https://openpolicyagent.org/downloads/v0.43.0/opa_linux_amd64_static
chmod 755 ./opa
# windows exe or install with choco
https://openpolicyagent.org/downloads/v0.43.0/opa_windows_amd64.exe
choco install open-policy-agent
```


# Trying OPA

Save this as `input.json`:
```json
{
    "servers": [
        {"id": "app", "protocols": ["https", "ssh"], "ports": ["p1", "p2", "p3"]},
        {"id": "db", "protocols": ["mysql"], "ports": ["p3"]},
        {"id": "cache", "protocols": ["memcache"], "ports": ["p3"]},
        {"id": "ci", "protocols": ["http"], "ports": ["p1", "p2"]},
        {"id": "busybox", "protocols": ["telnet"], "ports": ["p1"]}
    ],
    "networks": [
        {"id": "net1", "public": false},
        {"id": "net2", "public": false},
        {"id": "net3", "public": true},
        {"id": "net4", "public": true}
    ],
    "ports": [
        {"id": "p1", "network": "net1"},
        {"id": "p2", "network": "net3"},
        {"id": "p3", "network": "net2"}
    ]
}
```

Run `opa run input.json` for interactive REPL.  
This is a nice and fast way to explore the options, try out expressions etc.  
Play around with loaded JSON values (the `data` variable):
```
data.servers

data.servers[0].protocols
data.servers[0].protocols[j]
data.servers[_].protocols[_]
```

The `j` variable is created implicitly just for iteration purposes, usually not needed.  

The `_` (underscore) is kinda like `flatMap` operation, it goes through every server in example above,
same for protocols..  
For example, if you want all server ids you can type `data.servers[_]["id"]`. Very convenient.

As you can see, the brackets are not only for array indices, but can be used for dynamic keys, like in JS.

---
---
---
## Running the Server
```bash
opa run --server ./myrules.rego

# run this to reload on changes, watch
opa run -w --server .\myrules.rego
```

In production we'll want to use an OPA server, so it can be called from multiple places.  
We'll invoke it via its REST API.


---
---
---

# Rego language (ray-go)

When OPA evaluates policies it **binds data provided in the query** to a **global variable** called `input`.  
In the REPL above it was referred to as `data`, but here it's `input`.. A bit wierd for REPL IMHO.

Rego is more like SQL rather than a "real" programming language.

OPA reads policy files (`.rego` extension) and evaluates policies based on rules in them.  
A policy file looks roughly like this:
```
package myrules

default has_many_ports = false

# if he is admin
can_see_stuff {
    input.user.role == "admin"
}

# if something else...
can_see_stuff {
    input.user.whatever
    input.user.isvalid
}
```
Then you can refer to this rule like `myrules.can_see_stuff`,  
or from REST like `v1/data/myrules/can_see_stuff`.  

The `can_see_stuff` rule has 2 components (for easier reading), if either of those evaluates to `true` then the whole result is `true`.  
So multiple rules are `OR`-ed.

Rules in the second part of `can_see_stuff` has 2 expressions.  
Those 2 are joined with `AND` semantics.  
You can also use `;` operator for oneliners if needed: `input.user.whatever ; input.user.isvalid`

---


When OPA evaluates expressions, it **finds values for the variables that make all of the expressions true**.  
If there are no variable assignments that make all of the expressions true, the result is `undefined` (that's why we usually have a `default` value).

## Iteration
Iteration is done *implicitly*, forget about C-like iteration...  
When you write `some i; input.networks[i].public == true`, Rego will find all values for `i` for which the expression is `true`:
```
+---+
| i |
+---+
| 2 |
| 3 |
+---+
```


## Functions
All same stuff:
```
f(x) { x == "foo" }
f(x) if { x == "foo" }
f(x) if x == "foo"

f(x) := true { x == "foo" }
f(x) := true if { x == "foo" }
f(x) := true if x == "foo"
```


