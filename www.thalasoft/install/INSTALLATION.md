Installation

On the remote

Have the entry `thalasoft.com` in the virtual host

Create some directories specific to the website
```
mkdir -p ~/dev/docker/projects/learnintouch/www.thalasoft/app;
mkdir -p ~/dev/docker/projects/learnintouch/www.thalasoft/install;
mkdir -p ~/dev/docker/projects/learnintouch/volumes/www.thalasoft/account/data/;
mkdir -p ~/dev/docker/projects/learnintouch/volumes/www.thalasoft/account/backup/;
```

On the local

Copy some files
```
scp ~/dev/docker/projects/learnintouch/www.thalasoft/app/docker-compose.yml stephane@thalasoft.com:~/dev/docker/projects/learnintouch/www.thalasoft/app
scp ~/dev/docker/projects/learnintouch/www.thalasoft/install/docker-compose.yml stephane@thalasoft.com:~/dev/docker/projects/learnintouch/www.thalasoft/install
scp ~/dev/docker/projects/learnintouch/www.thalasoft/install/docker-secrets.sh stephane@thalasoft.com:~/dev/docker/projects/learnintouch/www.thalasoft/install
scp ~/dev/docker/projects/learnintouch/www.learnintouch/install/data.zip stephane@thalasoft.com:~/dev/docker/projects/learnintouch/volumes/www.thalasoft/account
```

On the remote

Create the secrets
```
cd ~/dev/docker/projects/learnintouch/www.thalasoft/install/;
./docker-secrets.sh
```

Create the website database
```
cd ~/dev/docker/projects/learnintouch/www.thalasoft/install
docker stack deploy --compose-file docker-compose.yml www_thalasoft
```

View the completion of the installation
The command should display an Exit 0 state or a Complete value for the container
```
docker stack ps www_thalasoft
docker stack rm www_thalasoft
```

Restaure the website data
```
cd ~/dev/docker/projects/learnintouch/volumes/www.thalasoft/account
unzip data.zip
rm data.zip
```

