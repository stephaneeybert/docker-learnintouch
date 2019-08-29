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

Create the volume directories
```
mkdir -p ~/dev/docker/projects/learnintouch/volumes/www.thalasoft;
mkdir -p ~/dev/docker/projects/learnintouch/volumes/www.learnintouch;
mkdir -p ~/dev/docker/projects/learnintouch/volumes/www.folkuniversitet;
```

Create a link to the engine source code
```
cd ~/dev/docker/projects/learnintouch/volumes/;
ln -s ~/dev/php/projects/learnintouch/engine engine;
```

Read and follow all the INSTALLATION.md files of the project

