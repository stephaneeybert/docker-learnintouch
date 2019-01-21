Opening the application
```
http://dev.learnintouch.com:81
http://dev.learnintouch.com:81/admin.php
```

Opening the application in production
```
http://www.thalasoft.com
http://www.thalasoft.com/admin.php
```

Starting the application in swarm mode
```
docker stack deploy --compose-file docker-compose-dev.yml learnintouch
```

Starting the application in swarm mode in production
```
docker stack deploy --compose-file docker-compose.yml learnintouch
```

Stopping the swarm application
```
docker stack rm learnintouch
```

