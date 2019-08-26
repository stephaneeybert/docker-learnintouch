Installation

On the local

Build the images
Respect their dependencies order  
cd nodejs-learnintouch; ./build.sh; cd ..;
cd learnintouch; ./build.sh; cd ..;
cd www.learnintouch; ./build.sh; cd ..;
cd www.thalasoft; ./build.sh; cd ..;
cd www.folkuniversitet; ./build.sh; cd ..;

On the remote

Pull the images
```  
docker pull thalasoft.com:5000/nodejs-learnintouch
docker pull thalasoft.com:5000/www.learnintouch
docker pull thalasoft.com:5000/www.thalasoft
docker pull thalasoft.com:5000/www.folkuniversitet
```  

TODO
Create the databases  
Create the database and the root user in `mariadb`  
Create the common database in the `learnintouch` docker
Create the websites databases in `www.`  

Read and follow all the INSTALLATION.md files of the project
