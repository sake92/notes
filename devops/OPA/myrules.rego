
package myrules

import future.keywords

###
default has_many_ports = false

has_many_ports {
    count(input.servers[0].ports) > 1
}


### returns a list of network ids
public_network contains net.id if {
    some net in input.networks # some network exists and..
    net.public                 # it is public.
}
#### same but different syntax
public_network2[net.id] {
    some net in input.networks # some network exists and..
    net.public                 # it is public.
}


### returns a list of server ids
# every rule adds to the final result set
shell_accessible contains server.id if {
    some server in input.servers
    "telnet" in server.protocols
}

shell_accessible contains server.id if {
    some server in input.servers
    "ssh" in server.protocols
}


### demo "every" keyword
default no_telnet_exposed = false
no_telnet_exposed if { # every + not-in
    every server in input.servers {
        not "telnet" in server.protocols
    }
}


