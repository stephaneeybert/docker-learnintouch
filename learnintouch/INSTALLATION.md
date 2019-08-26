Installation

On the remote

Create the project directory
```
mkdir -p ~/dev/docker/projects/learnintouch/learnintouch
```

On the local

scp ~/dev/docker/projects/learnintouch/learnintouch/docker-compose.yml stephane@thalasoft.com:~/dev/docker/projects/learnintouch/learnintouch
scp ~/dev/docker/projects/learnintouch/learnintouch/docker-secrets.sh stephane@thalasoft.com:~/dev/docker/projects/learnintouch/learnintouch

On the remote

Create the secrets
```
cd ~/dev/docker/projects/learnintouch/learnintouch;
./docker-secrets.sh
```

Create the common database in production
```
docker stack deploy --compose-file docker-compose.yml learnintouch
docker stack rm learnintouch
```

