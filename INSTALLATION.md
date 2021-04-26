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
cd ~/dev/docker/projects/learnintouch/www.europasprak/install; ./build.sh; cd ../app; ./build.sh;
cd ~/dev/docker/projects/learnintouch/www.fhs/install; ./build.sh; cd ../app; ./build.sh;
```  

On the remote

Pull the images
```  
docker pull thalasoft.com:5000/nodejs-learnintouch
docker pull thalasoft.com:5000/www.learnintouch
docker pull thalasoft.com:5000/www.thalasoft
docker pull thalasoft.com:5000/www.folkuniversitet
docker pull thalasoft.com:5000/www.europasprak
docker pull thalasoft.com:5000/www.fhs
```  

Create the volume directories
```
mkdir -p ~/dev/docker/projects/learnintouch/volumes/www.thalasoft;
mkdir -p ~/dev/docker/projects/learnintouch/volumes/www.learnintouch;
mkdir -p ~/dev/docker/projects/learnintouch/volumes/www.folkuniversitet;
mkdir -p ~/dev/docker/projects/learnintouch/volumes/www.europasprak;
mkdir -p ~/dev/docker/projects/learnintouch/volumes/www.fhs;
chmod g+s ~/dev/docker/projects/learnintouch/volumes
```

Read and follow all the INSTALLATION.md files of the project

