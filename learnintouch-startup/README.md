Open the application
http://dev.learnintouch.com:81/

Start the application in swarm mode
docker stack deploy --compose-file docker-compose-swarm-dev.yml learnintouch

Start the application in swarm mode in production
docker stack deploy --compose-file docker-compose-swarm.yml learnintouch

Stop the swarm application
docker stack rm learnintouch

