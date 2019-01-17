Make sure to have the entry `folkuniversitet.thalasoft.com` in the virtual host

Opening the website
```
http://folkuniversitet.thalasoft.com
http://folkuniversitet.thalasoft.com/admin.php
```

View the `www.learnintouch/README.md` file

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
