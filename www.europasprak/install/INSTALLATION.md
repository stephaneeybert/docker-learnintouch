Installation

Add the secrets to expand
In the `learnintouch/learnintouch/start.sh` file add an entry for each new secret
```
export WWW_EUROPASPRAK_DB_PASSWORD={{DOCKER-SECRET:WWW_EUROPASPRAK_DB_PASSWORD}}
```

On the remote

Have the entry `europasprak.com` in the virtual host

Create some directories specific to the website
```
mkdir -p ~/dev/docker/projects/learnintouch/www.europasprak/app;
mkdir -p ~/dev/docker/projects/learnintouch/www.europasprak/install;
mkdir -p ~/dev/docker/projects/learnintouch/volumes/www.europasprak/account/data/;
mkdir -p ~/dev/docker/projects/learnintouch/volumes/www.europasprak/account/backup/;
mkdir -p ~/dev/docker/projects/common/volumes/letsencrypt/certbot/conf/live/europasprak.com
```

On the local

Copy some files
```
scp -P 2002 ~/dev/docker/projects/learnintouch/www.europasprak/app/docker-compose.yml europasprak@europasprak.com:~/dev/docker/projects/learnintouch/www.europasprak/app
scp -P 2002 ~/dev/docker/projects/learnintouch/www.europasprak/install/docker-compose.yml europasprak@europasprak.com:~/dev/docker/projects/learnintouch/www.europasprak/install
scp -P 2002 ~/dev/docker/projects/learnintouch/www.europasprak/install/docker-secrets.sh europasprak@europasprak.com:~/dev/docker/projects/learnintouch/www.europasprak/install
nice scp -P 2002 ~/dev/docker/projects/learnintouch/www.europasprak/install/data.tar europasprak@europasprak.com:~/dev/docker/projects/learnintouch/volumes/www.europasprak/account
nice scp -P 2002 ~/dev/docker/projects/learnintouch/www.europasprak/install/db-data.sql europasprak@europasprak.com:~/dev/docker/projects/learnintouch/volumes/www.europasprak/account/backup/
```

On the remote

Create the secrets
```
cd ~/dev/docker/projects/learnintouch/www.europasprak/install/;
./docker-secrets.sh
```

Restaure the website image and audio data
```
cp data.tar ~/dev/docker/projects/learnintouch/volumes/www.europasprak/account
cd ~/dev/docker/projects/learnintouch/volumes/www.europasprak/account
tar -xvf data.tar
rm data.tar
```

Restaure the website database
Rename the archive file to db-data.sql
Copy the archive in the ~/dev/docker/projects/learnintouch/volumes/www.europasprak/account/data directory
Remove the archive

Create the website database
```
cd ~/dev/docker/projects/learnintouch/www.europasprak/install
docker stack deploy --compose-file docker-compose.yml www_europasprak
```

View the completion of the installation
The command should display an Exit 0 state or a Complete value for the container
```
docker stack ps www_europasprak
docker stack rm www_europasprak
```

