The docker-compose is used only to create and seed the common engine database. That is why it only has the MySql dependency.  

Change the `NODEJS_SOCKET_LOCALHOST` in the `setup/properties.php` file to have it as the name of the nodejs container: `http://dev.learnintouch.com`
```
define('NODEJS_SOCKET_LOCALHOST', 'http://dev.learnintouch.com');
```

The redis hostname is specified in the follwowing files:
```
learnintouch/php.ini
engine/api/js/socket/config.js

Change the session.save_path in the php.ini file to have it as the name of the redis container: `redis`
```
session.save_path = "tcp://redis:6379"
```

Viewing the completion of the installation  
The docker-compose ps command should display an Exit 0 state for the learnintouch container

Packaging the learnintouch source code:
```
cd /home/stephane/dev/php/projects/learnintouch;
zip engine.zip engine -r -x "*.git/*";
scp engine.zip stephane@...:/home/stephane/dev/docker/projects/learnintouch/volumes/
rm engine.zip
```
Rebuild the image if repackaging

TODO:
Have the document root of the domains outside of the docker container so as to have them accessible by the letsencrypt cron job for certificate renewal... Or use letsencrypt from within a container...
The tar archive of the backup is saved in the container instead of in the website volume. Move it under the website volume data/ directory.

