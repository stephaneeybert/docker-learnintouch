The docker-compose is used only to create and seed the common engine database. That is why it only has the MySql dependency.

Change the NODEJS_SOCKET_LOCALHOST in the setup/properties.php file to have it as the name of the nodejs container: http://dev.learnintouch.com
define('NODEJS_SOCKET_LOCALHOST', 'http://dev.learnintouch.com');

Change the session.save_path in the php.ini file to have it as the name of the redis container: redis
session.save_path = "tcp://redis:6379"

Packaging the learnintouch source code:
cd /home/stephane/dev/php/projects/learnintouch
zip engine.zip engine -r -x "*.git/*" ".*.swp";
cp engine.zip /home/stephane/dev/docker/projects/learnintouch/learnintouch;
rm engine.zip
Rebuild the image if repackaging

Install the engine
cd /home/stephane/dev/docker/projects/learnintouch
docker-compose up -d

View the completion of the installation
The docker-compose ps command should display an Exit 0 state for the learnintouch container

Delete the containers after the installation is complete
docker-compose down
