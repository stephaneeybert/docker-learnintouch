Installation

Add the secrets to expand
In the `learnintouch/learnintouch/start.sh` file add an entry for each new secret
```
export WWW_FHS_DB_PASSWORD={{DOCKER-SECRET:WWW_FHS_DB_PASSWORD}}
```

On the remote

Have the entry `fhs.europasprak.com` in the virtual host

Create some directories specific to the website
```
mkdir -p ~/dev/docker/projects/learnintouch/www.fhs/app;
mkdir -p ~/dev/docker/projects/learnintouch/www.fhs/install;
mkdir -p ~/dev/docker/projects/learnintouch/volumes/www.fhs/account/data/;
mkdir -p ~/dev/docker/projects/learnintouch/volumes/www.fhs/account/backup/;
```

On the local

Copy some files
```
scp ~/dev/docker/projects/learnintouch/www.fhs/app/docker-compose.yml europasprak@europasprak.com:~/dev/docker/projects/learnintouch/www.fhs/app
scp ~/dev/docker/projects/learnintouch/www.fhs/install/docker-compose.yml europasprak@europasprak.com:~/dev/docker/projects/learnintouch/www.fhs/install
scp ~/dev/docker/projects/learnintouch/www.fhs/install/docker-secrets.sh europasprak@europasprak.com:~/dev/docker/projects/learnintouch/www.fhs/install
scp ~/dev/docker/projects/learnintouch/www.learnintouch/install/data.zip europasprak@europasprak.com:~/dev/docker/projects/learnintouch/volumes/www.fhs/account
```

On the remote

Create the secrets
```
cd ~/dev/docker/projects/learnintouch/www.fhs/install/;
./docker-secrets.sh
```

Create the website database
```
cd ~/dev/docker/projects/learnintouch/www.fhs/install;
docker stack deploy --compose-file docker-compose.yml www_fhs
```

Restaure the website data
```
cd ~/dev/docker/projects/learnintouch/volumes/www.fhs/account
tar -xvf data.tar
rm data.tar
```

Restaure the website database
Rename the archive file to db-data.sql
Copy the archive in the ~/dev/docker/projects/learnintouch/volumes/www.fhs/account/data directory
Remove the archive

Create the website database
```
cd ~/dev/docker/projects/learnintouch/www.fhs/install
docker stack deploy --compose-file docker-compose.yml www_fhs
```

View the completion of the installation
The command should display an Exit 0 state or a Complete value for the container
```
watch docker stack ps www_fhs
docker stack rm www_fhs
```

