Installation

On the remote

Create the project directory
```
mkdir -p ~/dev/docker/projects/learnintouch/learnintouch
```

On the local

Copy the files
```
scp ~/dev/docker/projects/learnintouch/learnintouch/docker-compose.yml stephane@thalasoft.com:~/dev/docker/projects/learnintouch/learnintouch
scp ~/dev/docker/projects/learnintouch/learnintouch/docker-secrets.sh stephane@thalasoft.com:~/dev/docker/projects/learnintouch/learnintouch
```

Deploy the source code
```
cd ~/dev/php/projects/learnintouch;
zip engine.zip engine -r -x "*.git/*";
scp engine.zip stephane@thalasoft.com:~/dev/docker/projects/learnintouch/volumes/
rm engine.zip
```

On the remote

Create the secrets
```
cd ~/dev/docker/projects/learnintouch/learnintouch;
./docker-secrets.sh
```

Create the common database
```
docker stack deploy --compose-file docker-compose.yml learnintouch
```

View the completion of the installation
The `docker stack ps learnintouch` command should display an Exit 0 state or a Complete value for the learnintouch container
```
docker stack ps learnintouch
docker stack rm learnintouch
```

Unpack the source code
```
cd ~/dev/docker/projects/learnintouch/volumes;
unzip engine.zip;
```
