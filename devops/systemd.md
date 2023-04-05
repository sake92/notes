
# SystemD
https://www.freedesktop.org/software/systemd/man/systemd.exec.html

Automatic run(on boot), restart, config of a service/app.  

For example a Java Spring web server.  
If you have scripts like `run.sh`, `stop.sh`, and calling `ps aux | grep myapp | kill -9` etc.. you should STOP.  
Use SystemD!

## Create your own service

Create a file `~/scripts/my_app.sh`:
```sh
#!/bin/bash
echo $(date) >> log.txt
sleep 5
```


Create a file `/etc/systemd/system/my_app.service` with this contents:
```
[Unit]
Description=my_app service
After=network.target

[Service]
Type=simple
User=sake
WorkingDirectory=~
ExecStart=/bin/bash scripts/my_app.sh
Restart=always
RestartSec=1

[Install]
WantedBy=multi-user.target
```

It says that our `my_app.service` to run **after network is initialized** (on boot).

You have to be careful with paths.  
It is a good idea to specify a User other than `root`.  
And do set a WorkingDirectory so that your scripts can find paths correctly, relative to that folder.

```
sudo chmod 644 /etc/systemd/system/my_app.service

sudo systemctl status my_app.service
sudo systemctl start  my_app.service
sudo systemctl stop   my_app.service
```

Logs:
```
journalctl -u my_app.service -f
```

https://everyday.codes/linux/services-in-systemd-in-depth-tutorial/
https://gsswain.medium.com/springboot-digitalocean-droplets-410b8bbc6fe6
https://www.digitalocean.com/community/tutorials/understanding-systemd-units-and-unit-files


## Limitations
Not so easy to make a healtcheck.

When making HTTP server, you usually have a `/health` endpoint.  
When you get a 200 OK, you know that your service is in a good shape.  
Otherwise (maybe database wasnt available or something) you'd like to restart it, maybe that will fix it.  

Another issue that happened to me is **memory leak**.  
In this state your app is **frozen**, the process is up -> systemd thinks all is good!!!  
But your app cannot respond to any request because it doesn't have any more memory.  
In this case `/health` would timeout, so you have to restart it..

This is not remotely easy to do with Systemd alone.  
You'd have to make an external cron job, that would ping `/health` every now and then.

With Docker you have `HEALTCHECK` command that enables this out of the box!  
Other benefits of Docker:
- you dont have to make a new user for every service
- you dont have to worry about file permissions etc
- ports are not exposed by default
So, Docker seems like a (almost)perfect sandbox!




