Starting the application in swarm mode
```
docker stack deploy --compose-file docker-compose-swarm.yml letsencrypt
```

Stopping the swarm application
```
docker stack rm letsencrypt
```
