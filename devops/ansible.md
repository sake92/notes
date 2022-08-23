


# Setup for a remote machine

1.1. Generate an ssh key on local machine
```
ssh-keygen
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

1.2. Add to `~/.ssh/config`
Host my_server
    HostName my_server_ip
    User my_user
    IdentityFile ~/.ssh/id_rsa_my_server

2. add the public key to `~/.ssh/authorized_keys` on the server

3. Make a `hosts.ini` file:
```
[my_server]
143.244.209.171
```


Run on local machine:
```bash
ansible -i hosts.ini my_server -m ping -u my_user
```

Should print:
```bash
123.456.123.456 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python3"
    },
    "changed": false,
    "ping": "pong"
}
```

Run any command from ansible:
```bash
ansible -i hosts.ini my_server -a "free -h" -u my_user
```




