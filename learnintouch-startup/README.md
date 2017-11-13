Start the application in the dev environment
cd /home/stephane/dev/docker/projects/learnintouch/learnintouch-startup
docker-compose -f docker-compose-dev.yml up -d

Stop the application
docker-compose down

Open the application
http://dev.learnintouch.com:81/

Start the application in swarm mode
docker stack deploy --compose-file docker-compose-swarm-dev.yml learnintouch

Stop the swarm application
docker stack rm learnintouch

