
# Puppet

Puppet is a configuration management tool. 
It is quite old and stable, has a huge ecosystem of reliable modules.  
Some newer alternatives are Ansible, Chef and others.

Recommended book: https://www.amazon.com/Puppet-Beginners-Guide-Third-newbie/dp/178847290X

A good additional software to test Puppet locally is Vagrant.  
It can bring up a Virtual machine and you can play around with it, without compromising your local setup.  
And when done you can easily remove it with `vagrant destroy`.

Puppet code is written in Puppet language, very similar to Ruby.  
It has everything you'd expect: numbers, strings, booleans, objects/hashes, variables, for loops etc.


Puppet programs are called "manifests".  
A basic example of a Puppet manifest:
```
package { 'curl':
    ensure => installed,
}
```
It says that the configured node(s) need to have "curl" package installed.  
Here we say what state of a node we want, not *how it is done*.  
This way of thinking and writing code is called "declarative" (declare what, not how).  

The "how" part is delegated to the "package" function.  
It knows how to check if "curl" is already installed, and how to install it if it is not.  
We do not have to worry about that part. Neat!

In the code above:
- "package" is **resource type**
- "curl" is **resource name**
- "ensure" is an **attribute name**, there can be lots of these
- "installed" is an **attribute value**, there can be lots of these

There can only be one resource with a given type and name.  
They need to be unique so that you can reference them from other resources, to establish dependencies, notify other resources about changes and similar.


## Puppet execution
Puppet will fetch changes periodically and apply them, so you need to be careful about files and software installed by Puppet.  
For example, if you have a manifest like this:
```
file { '/tmp/hello.txt':
    ensure => file,
    content => "hello, world\n",
}
```
Puppet will make that file and write that exact content to it.  
If you manually tweak it, add another line for example, 
Puppet will see its content does not match the desired state,
and it will overwrite it with "hello, world\n" again!!!


----
There are lots of built-in resources that are very useful:
- file handling
- user handling
- packages/programs (even on Windows!)
- services/daemons
- exec for executing arbitrary shell commands
- schedulers

https://puppet.com/docs/puppet/6/resource_types.html

### Order of execution
```
file { 'Git installer':
    path => 'C:\tmp\git-installer.msi'
    source => 'https://github.com/git-for-windows/git/releases/download/v2.38.1.windows.1/Git-2.38.1-64-bit.exe',

}
package { "Git":
 ensure          => installed,
 source          => 'C:\tmp\git-installer.msi',
 install_options => ['/VERYSILENT'],
 require         => File['Git installer'],
}
```

If we didn't specify `require => File['Git installer']` clause, Puppet could execute it in arbitrary order.  
In order to ensure that file has been first downloaded, we use the `require` clause.  
Puppet builds a dependency graph and knows in which order to execute resources.  
Notice that the resource type needs to be uppercased!



## Classes

Classes group resources declarations.  
Just a more handy way to manage things.

--------------

# Architecture
With Puppet you can write configuration for many different machines, and configure all of them with just one command.  
It can work in 2 modes:
- master-slave mode, 
- masterless/git mode

## Master-slave mode
Agent software needs to be installed on every configured(slave) node.  
Agents periodically poll the master to send it changes that need to happen.

## Masterless/standalone mode
Agent software needs to be installed on every configured node.  
Instead of master server there is a simple Git repository from where agents fetch their configuration, periodically.

> Just for comparison, Ansible uses a third way,
> where master logs into slave nodes via SSH and executes commands.
> This approach is a lot more flexible since you don't have to install agents or have them running on slave nodes.



-------------
# Modules
There is a central repository that indexes most of the modules available to you, called Forge.  
https://forge.puppet.com/

But, of course, you can use any Git repo with Puppet module, be that public from GitHub or an internal/private repo.


## R10k
Instead of manually git-cloning repos to your Puppet codebase, r10k tool does that automatically for you.

All modules are specified in a single `Puppetfile` file, something like this:

```
forge 'http://forge.puppetlabs.com'

mod 'puppet/staging', '2.2.0'
mod 'puppetlabs/apache', '2.0.0'

mod 'pbg_ntp',
    :git => 'https://github.com/bitfield/pbg_ntp.git',
    :tag => '0.1.4'
```

https://github.com/puppetlabs/r10k



-----------
# Hiera

It is a good idea to separate code and data.  
We do it all the time in software dev, data is usually stored in some database.  
Why is this good for config management?  
Well, versions change, paths change.. and it's quite time consuming to grep through source code and find-and-replace those values.  
And sometimes we need to do this fast, because bugs+vulnerabilites appear constantly and we need to be up-to-date.

In Puppet we use the Hiera database.  
It mainly consists of plaintext files, but there are tools you can use to encrypt its data.

Hiera files are usually written in YAML, but you can also use JSON or HOCON.  
Example `common.yaml`:
```
---
    test: 'testtt'
    some_path: '/var/backups'
```
Then from code:
```
file { lookup('some_path', String):
    ensure => directory,
}
```

But before you can use the file above, you need a `hiera.yaml` config file:
```
---
version: 5
    defaults:
datadir: data
    data_hash: yaml_data
hierarchy:
    - name: "Common defaults"
      path: "common.yaml"
```
The `datadir` attribute says that Hiera will look for YAML files inside `data` folder.  
The `hierarchy` attribute says that Hiera will look in "common.yaml" file first.  

## Referencing other data
You can use "facts" inside Hiera file itself:
```
backup_path: "/backup/%{facts.hostname}"
```
Here we read the `facts.hostname` variable.


## Hierarchy

The hierarchy attribute is really useful.  
You can specify the order of data files in which Hiera reads.  
Example:
```
hierarchy:
- name: "Host-specific data"
  path: "nodes/%{facts.hostname}.yaml"
- name: "Common defaults"
  path: "common.yaml"
```
If you have a node with a hostname `node1`,  
Hiera will first try `nodes/node1.yaml` to find a particular data,  
and if it is not there then it will look into `common.yaml`. Neat!

You can also collect multiple values from all of the data files by using "merge behavior".


## Encryption

See hiera-eyaml-gpg, eyaml editor etc. 

Big disadvantage is that every slave node needs same decryption key.. wack.  
Better to use Vault integration if possible.



## Classes and Hiera

When you include a `class abc` which has a parameter `x`,  
Puppet searches Hiera for keys matching the name `abc::x`.  

For example, if you use `include nginx` then in Hiera you can specify `nginx::version: '1.2.3'`. Neat!








--------------

# Environments

Default environment is called "production".  
You can manage multiple environments if needed, from a single place.



----------------

There are other conceps to learn, like profiles, roles etc.  
Those are mainly around grouping code in a flexible way.

Sometimes people put **everyting into hiera**
- specify roles for a given node
- put parameters those role need

Other things you'll probably meet in wild are Puppet templates,  
those are used for generating various scripts and config files.





