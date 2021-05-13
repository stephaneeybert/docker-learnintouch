Installation

On the remote

Start the application
```
cd ~/dev/docker/projects/learnintouch/www.fhs/app;
docker stack deploy --compose-file docker-compose.yml www_fhs
```

On the local

Open the website
```
https://fhs.europasprak.com
https://fhs.europasprak.com/admin.php
```

Stopping the swarm application
```
docker stack rm www_fhs
```

