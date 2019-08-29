Installation

On the remote

Create some directories specific to the website
```
mkdir -p ~/dev/docker/projects/learnintouch/www.learnintouch/app;
mkdir -p ~/dev/docker/projects/learnintouch/www.learnintouch/install;
mkdir -p ~/dev/docker/projects/learnintouch/volumes/www.learnintouch/account/data/;
mkdir -p ~/dev/docker/projects/learnintouch/volumes/www.learnintouch/account/backup/;
```

On the local

Copy some files
```
scp ~/dev/docker/projects/learnintouch/www.learnintouch/app/docker-compose.yml stephane@thalasoft.com:~/dev/docker/projects/learnintouch/www.learnintouch/app
scp ~/dev/docker/projects/learnintouch/www.learnintouch/install/docker-compose.yml stephane@thalasoft.com:~/dev/docker/projects/learnintouch/www.learnintouch/install
scp ~/dev/docker/projects/learnintouch/www.learnintouch/install/docker-secrets.sh stephane@thalasoft.com:~/dev/docker/projects/learnintouch/www.learnintouch/install
```

On the remote

Create the secrets
```
cd ~/dev/docker/projects/learnintouch/www.learnintouch/install/;
./docker-secrets.sh
```

Create the database
```
cd ~/dev/docker/projects/learnintouch/www.learnintouch/install/;
docker stack deploy --compose-file docker-compose.yml www_learnintouch;
```

View the completion of the installation  
The command should display an Exit 0 state or a Complete value for the container
```
docker stack ps www_learnintouch
docker stack rm www_learnintouch;
```

Copy the files TODO
```
cp ~/dev/docker/projects/learnintouch/volumes/www.learnintouch/account/data/backup/db_learnintouch-structure.sql .
cp ~/dev/docker/projects/learnintouch/volumes/www.learnintouch/account/data/backup/db_learnintouch.sql .
```

