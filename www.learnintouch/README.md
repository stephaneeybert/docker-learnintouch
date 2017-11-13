The docker-compose is used only to create and seed the learnintouch.com database. For this operation, it only needs the MySql dependency.

Change some configuration if the setup/properties.php file

The specific.php file must use the 'mysql' host for the DB_HOST value
The hostname is given by Docker and is the name of the container running MySQL
define('DB_HOST', "mysql");

Remove the existing data
cd /home/stephane/dev/php/learnintouch/docker
sudo rm -fr mysql/

Copy any existing website data into an external volume
mkdir -p /home/stephane/dev/php/learnintouch/docker/website/
cp data.zip /home/stephane/dev/php/learnintouch/docker/website/
cd /home/stephane/dev/php/learnintouch/docker/website/
unzip data.zip
rm data.zip

Creating the structure and data files
Run these sql statements in the learnintouch-startup container, logged into its bash:
/usr/bin/mysql/install/bin/mysqldump -h mysql -P 3306 --protocol=tcp -u root -p --default-character-set=latin1 --skip-extended-insert --add-drop-table --no-data db_learnintouch > /usr/bin/learnintouch/www/learnintouch.com/account/data/backup/db_learnintouch-structure.sql
/usr/bin/mysql/install/bin/mysqldump -h mysql -P 3306 --protocol=tcp -u root -p --default-character-set=latin1 --skip-extended-insert --no-create-info db_learnintouch > /usr/bin/learnintouch/www/learnintouch.com/account/data/backup/db_learnintouch.sql
Add the instructions to the db_learnintouch.sql file
set autocommit = 0;
set unique_checks = 0;
set foreign_key_checks = 0;
commit;
Copy the files
cp /home/stephane/dev/php/learnintouch/docker/website/data/db_learnintouch-structure.sql .
cp /home/stephane/dev/php/learnintouch/docker/website/data/db_learnintouch.sql .
Rebuild the docker image

Doing a dump of the structure
docker exec -it learnintouch-startup bash
/usr/bin/mysql/install/bin/mysqldump --protocol=tcp -h mysql -P 3306 -u root -p --default-character-set=latin1 --skip-extended-insert --add-drop-table --no-data db_learnintouch -v > /usr/bin/learnintouch/db-structure.sql
docker cp learnintouch-startup:/usr/bin/learnintouch/db-structure.sql www.learnintouch/

Doing a dump of the data
docker exec -it learnintouch-startup bash
/usr/bin/mysql/install/bin/mysqldump --protocol=tcp -h mysql -P 3306 -u root -p --default-character-set=latin1 --skip-extended-insert --no-create-info db_learnintouch -v > /usr/bin/learnintouch/db-data.sql
docker cp learnintouch-startup:/usr/bin/learnintouch/db-data.sql www.learnintouch/

Install the application
cd /home/stephane/dev/docker/projects/www.learnintouch
docker-compose up

View the completion of the installation
The docker-compose ps command should display an Exit 0 state for the www.learnintouch container
$ docker-compose ps
      Name                    Command               State            Ports         
-----------------------------------------------------------------------------------
learnintouch.com   /bin/bash /usr/bin/learnin ...   Exit 0                         
mysql              /bin/bash install/startup.sh     Up       0.0.0.0:3307->3306/tcp

Delete the containers after the installation is complete
docker-compose down

