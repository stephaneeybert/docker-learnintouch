Make sure to have the entry `thalasoft.com` in the virtual host

Opening the website
```
http://www.thalasoft.com
http://www.thalasoft.com/admin.php
```

View the `www.learnintouch/README.md` file

Installing the website
```
cd dev/docker/projects/learnintouch/www.thalasoft/
docker stack deploy --compose-file docker-compose-dev.yml wwwthalasoft
docker stack rm wwwthalasoft
```

Installing the website in production
```
cd dev/docker/projects/learnintouch/www.thalasoft/
docker stack deploy --compose-file docker-compose.yml wwwthalasoft
docker stack rm wwwthalasoft
```
