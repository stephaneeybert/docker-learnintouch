Start the application in swarm mode
docker stack deploy --compose-file docker-compose-swarm-dev.yml learnintouch

Start the application in swarm mode in production
docker stack deploy --compose-file docker-compose-swarm.yml learnintouch

Stop the swarm application
docker stack rm learnintouch

Another way to start the dev application locally
```cd ~/dev/docker/projects/learnintouch/learnintouch-startup```  
```docker-compose -f docker-compose-dev.yml up -d```  

and to stop it
docker-compose down
