Opening the website
```
https://dev.thalasoft.com:83
https://dev.thalasoft.com:83/admin.php
```

Starting the application in swarm mode
```
cd ~/dev/docker/projects/learnintouch/www.thalasoft/app;
docker stack deploy --compose-file docker-compose.yml www_thalasoft
```

Stopping the swarm application
```
docker stack rm www_thalasoft
```

