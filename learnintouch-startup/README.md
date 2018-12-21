Open the application
http://dev.learnintouch.com:81/

Start the application in swarm mode
docker stack deploy --compose-file docker-compose-swarm-dev.yml learnintouch

Stop the swarm application
docker stack rm learnintouch

