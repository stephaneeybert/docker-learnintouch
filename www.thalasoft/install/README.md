Make sure to have the entry `thalasoft.com` in the virtual host

View the `www.learnintouch/README.md` file

Creating the volumes directories specific to the website
```
mkdir volumes/www.thalasoft/account/data/;
mkdir volumes/www.thalasoft/account/backup/;
```

Installing the website
```
cd www.thalasoft/
docker stack deploy --compose-file docker-compose-dev.yml www_thalasoft
docker stack rm www_thalasoft
```

Installing the website in production
```
cd www.thalasoft/
docker stack deploy --compose-file docker-compose.yml www_thalasoft
docker stack rm www_thalasoft
```

