Installation

On the remote

Start the application
```
cd ~/dev/docker/projects/learnintouch/www.europasprak/app;
docker stack deploy --compose-file docker-compose.yml www_europasprak
```

On the local

Open the website
```
https://www.europasprak.com:83
https://www.europasprak.com:83/admin.php
https://fhs.europasprak.com:83
https://fhs.europasprak.com:83/admin.php
```

Stopping the swarm application
```
docker stack rm www_europasprak
```

