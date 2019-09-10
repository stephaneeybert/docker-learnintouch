Installation

On the remote

Start the application
```
cd ~/dev/docker/projects/learnintouch/www.thalasoft/app;
docker stack deploy --compose-file docker-compose.yml www_thalasoft
```

On the local

Open the website
```
https://dev.thalasoft.com:83
https://dev.thalasoft.com:83/admin.php
```

Stopping the swarm application
```
docker stack rm www_thalasoft
```

