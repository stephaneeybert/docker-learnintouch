Starting the application in swarm mode
```
cd learnintouch-startup
docker stack deploy --compose-file docker-compose-dev.yml learnintouch
```

Starting the application in swarm mode in production
```
cd learnintouch-startup
docker stack deploy --compose-file docker-compose.yml learnintouch
```

Stopping the swarm application
```
docker stack rm learnintouch
```

Another way to start the dev application locally
```
cd learnintouch-startup
docker-compose -f docker-compose-dev.yml up -d
```  

and to stop it
```  
docker-compose down
```  

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

