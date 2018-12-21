Make sure to have the entry:
learnintouch.com in the virtual host
or the entry:
127.0.1.1 dev.learnintouch.com in the /etc/hosts file

Open the website
http://dev.learnintouch.com:81
http://dev.learnintouch.com:81/admin.php
http://www.learnintouch.com
http://www.learnintouch.com/admin.php

Change some configuration if the setup/properties.php file
The specific.php file must use the 'mysql' host for the DB_HOST value
The hostname is given by Docker and is the name of the container running MySQL
define('DB_HOST', "mysql");

Removing the existing data
cd /home/stephane/dev/docker/projects/learnintouch/volumes/www.learnintouch/account/
sudo rm -fr data/

Copying any existing website data into an external volume
mkdir -p ~/dev/docker/projects/learnintouch/volumes/www.learnintouch/account
cp data.zip ~/dev/docker/projects/learnintouch/volumes/www.learnintouch/account
cd ~/dev/docker/projects/learnintouch/volumes/www.learnintouch/account
unzip data.zip
rm data.zip

Creating the structure and data files
Run these sql statements in the learnintouch-startup container, logged into its bash:
/usr/bin/mariadb/install/bin/mysqldump -h mysql -P 3306 --protocol=tcp -u root -p --default-character-set=latin1 --skip-extended-insert --add-drop-table --no-data db_learnintouch > /usr/bin/learnintouch/www/learnintouch.com/account/data/backup/db_learnintouch-structure.sql
/usr/bin/mariadb/install/bin/mysqldump -h mysql -P 3306 --protocol=tcp -u root -p --default-character-set=latin1 --skip-extended-insert --no-create-info db_learnintouch > /usr/bin/learnintouch/www/learnintouch.com/account/data/backup/db_learnintouch.sql
Add the instructions to the db_learnintouch.sql file
set autocommit = 0;
set unique_checks = 0;
set foreign_key_checks = 0;
commit;
Copy the files
cp ~/dev/docker/projects/learnintouch/volumes/www.learnintouch/account/data/backup/db_learnintouch-structure.sql .
cp ~/dev/docker/projects/learnintouch/volumes/www.learnintouch/account/data/backup/db_learnintouch.sql .
Rebuild the docker image

Doing a dump of the structure
docker exec -it learnintouch-startup bash
/usr/bin/mariadb/install/bin/mysqldump --protocol=tcp -h mysql -P 3306 -u root -p --default-character-set=latin1 --skip-extended-insert --add-drop-table --no-data db_learnintouch -v > /usr/bin/learnintouch/db-structure.sql
docker cp learnintouch-startup:/usr/bin/learnintouch/db-structure.sql www.learnintouch/

Doing a dump of the data
docker exec -it learnintouch-startup bash
/usr/bin/mariadb/install/bin/mysqldump --protocol=tcp -h mysql -P 3306 -u root -p --default-character-set=latin1 --skip-extended-insert --no-create-info db_learnintouch -v > /usr/bin/learnintouch/db-data.sql
docker cp learnintouch-startup:/usr/bin/learnintouch/db-data.sql www.learnintouch/

Installing the database for the website
The docker-compose is used only to create and seed the learnintouch.com database. For this operation, it only needs the MySql dependency.
cd /home/stephane/dev/docker/projects/www.learnintouch

Installing the website
docker stack deploy --compose-file docker-compose-dev.yml wwwlearnintouch
docker stack rm wwwlearnintouch

Installing the website in production
docker stack deploy --compose-file docker-compose.yml wwwlearnintouch
docker stack rm wwwlearnintouch

View the completion of the installation
The docker-compose ps command should display an Exit 0 state for the www.learnintouch container
$ docker-compose ps
      Name                    Command               State            Ports         
-----------------------------------------------------------------------------------
learnintouch.com   /bin/bash /usr/bin/learnin ...   Exit 0                         
mysql              /bin/bash install/startup.sh     Up       0.0.0.0:3307->3306/tcp

