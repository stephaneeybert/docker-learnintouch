Opening the website
```
https://dev.learnintouch.com:83
https://dev.learnintouch.com:83/admin.php
```

Starting the application in swarm mode
```
docker stack deploy --compose-file docker-compose.yml www_learnintouch
```

Stopping the swarm application
```
docker stack rm www_learnintouch
```

