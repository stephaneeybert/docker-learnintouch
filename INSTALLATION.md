Installation

On the local

Build the images
Respect their dependencies order  
```  
cd ~/dev/docker/projects/learnintouch/nodejs-learnintouch; ./build.sh;
cd ~/dev/docker/projects/learnintouch/learnintouch; ./build.sh;
cd ~/dev/docker/projects/learnintouch/www.learnintouch/install; ./build.sh; cd ../app; ./build.sh;
cd ~/dev/docker/projects/learnintouch/www.thalasoft/install; ./build.sh; cd ../app; ./build.sh;
cd ~/dev/docker/projects/learnintouch/www.folkuniversitet/install; ./build.sh; cd ../app; ./build.sh;
```  

On the remote

Pull the images
```  
docker pull thalasoft.com:5000/nodejs-learnintouch
docker pull thalasoft.com:5000/www.learnintouch
docker pull thalasoft.com:5000/www.thalasoft
docker pull thalasoft.com:5000/www.folkuniversitet
```  

Create the volume directories
```
mkdir -p ~/dev/docker/projects/learnintouch/volumes/www.thalasoft;
mkdir -p ~/dev/docker/projects/learnintouch/volumes/www.learnintouch;
mkdir -p ~/dev/docker/projects/learnintouch/volumes/www.folkuniversitet;
```

Read and follow all the INSTALLATION.md files of the project

