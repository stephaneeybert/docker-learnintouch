Installation

On the remote

Have the entry `folkuniversitet.thalasoft.com` in the virtual host

Create some directories specific to the website
```
mkdir -p ~/dev/docker/projects/learnintouch/www.folkuniversitet/app;
mkdir -p ~/dev/docker/projects/learnintouch/www.folkuniversitet/install;
mkdir -p ~/dev/docker/projects/learnintouch/volumes/www.folkuniversitet/account/data/;
mkdir -p ~/dev/docker/projects/learnintouch/volumes/www.folkuniversitet/account/backup/;
```

On the local

Copy some files
```
scp ~/dev/docker/projects/learnintouch/www.folkuniversitet/app/docker-compose.yml stephane@thalasoft.com:~/dev/docker/projects/learnintouch/www.folkuniversitet/app
scp ~/dev/docker/projects/learnintouch/www.folkuniversitet/install/docker-compose.yml stephane@thalasoft.com:~/dev/docker/projects/learnintouch/www.folkuniversitet/install
scp ~/dev/docker/projects/learnintouch/www.folkuniversitet/install/docker-secrets.sh stephane@thalasoft.com:~/dev/docker/projects/learnintouch/www.folkuniversitet/install
scp ~/dev/docker/projects/learnintouch/www.folkuniversitet/install/data.zip stephane@thalasoft.com:~/dev/docker/projects/learnintouch/volumes/www.folkuniversitet/account
```

On the remote

Create the secrets
```
cd ~/dev/docker/projects/learnintouch/www.folkuniversitet/install/;
./docker-secrets.sh
```

Create the website database
```
cd ~/dev/docker/projects/learnintouch/www.folkuniversitet/install
docker stack deploy --compose-file docker-compose.yml www_folkuniversitet
```

View the completion of the installation
The command should display an Exit 0 state or a Complete value for the container
```
docker stack ps www_folkuniversitet
docker stack rm www_folkuniversitet
```

Restaure the website data
```
cd ~/dev/docker/projects/learnintouch/volumes/www.folkuniversitet/account
unzip data.zip
rm data.zip
```

