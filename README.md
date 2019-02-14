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

