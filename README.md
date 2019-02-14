Deploying the application  

Build and install the images  
Build all the images respecting their dependencies order  
On the remote host do a pull command  
```  
docker pull thalasoft.com:5000/learnintouch-startup
docker pull thalasoft.com:5000/nodejs-learnintouch
```  

Creating the databases  
Create the database and the root user in `mariadb`  
Create the common database in `learnintouch`  
Create the websites databases in `www.`  

Opening the application
```
http://dev.learnintouch.com:81
http://dev.learnintouch.com:81/admin.php
```

Opening the application in production
```
http://www.thalasoft.com
http://www.thalasoft.com/admin.php
```

Starting the application in swarm mode
```
docker stack deploy --compose-file docker-compose-dev.yml learnintouch
```

Starting the application in swarm mode in production
```
docker stack deploy --compose-file docker-compose.yml learnintouch
```

Stopping the swarm application
```
docker stack rm learnintouch
