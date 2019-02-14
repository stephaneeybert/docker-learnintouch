Opening the website
```
https://folkuniversitet.thalasoft.com:83
https://folkuniversitet.thalasoft.com:83/admin.php
```

Starting the application in swarm mode
```
docker stack deploy --compose-file docker-compose.yml www_folkuniversitet
```

Stopping the swarm application
```
docker stack rm www_folkuniversitet
```

