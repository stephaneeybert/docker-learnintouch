Make sure to have the entry `folkuniversitet.thalasoft.com` in the virtual host

View the `www.learnintouch/README.md` file

Creating the volumes directories specific to the website
```
mkdir volumes/www.folkuniversitet/account/data/;
mkdir volumes/www.folkuniversitet/account/backup/;
```

Installing the website
```
docker stack deploy --compose-file docker-compose-dev.yml wwwfolkuniversitet
docker stack rm wwwfolkuniversitet
```

Installing the website in production
```
docker stack deploy --compose-file docker-compose.yml wwwfolkuniversitet
docker stack rm wwwfolkuniversitet
```

Creating the secrets
```
./docker-secrets.sh
```
