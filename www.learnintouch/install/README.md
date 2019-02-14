Adding the hostname
Have the entry `127.0.1.1 dev.thalasoft.com` in the `/etc/hosts` file
Have the entry `dev.thalasoft.com` in the virtual host

Installing the database for the website
The docker-compose is used only to create and seed the `learnintouch.com` database. For this operation, it only needs the MySql dependency.

Creating the database
```
cd www.learnintouch
docker stack deploy --compose-file docker-compose-dev.yml www_learnintouch
docker stack rm www_learnintouch
```

Creating the database in production
```
cd www.learnintouch
docker stack deploy --compose-file docker-compose.yml www_learnintouch
docker stack rm www_learnintouch
```

View the completion of the installation  
The `docker stack ps www_learnintouch` command should display an Exit 0 state or a Complete value for the www.learnintouch container
```
docker stack ps www_learnintouch
```

Removing the existing file data specific to the website
```
sudo rm -fr volumes/www.learnintouch/account/data/
```

Copying any existing website data into the website
```
mkdir -p ~/dev/docker/projects/learnintouch/volumes/www.learnintouch/account
cp data.zip ~/dev/docker/projects/learnintouch/volumes/www.learnintouch/account
cd ~/dev/docker/projects/learnintouch/volumes/www.learnintouch/account
unzip data.zip
rm data.zip
```

Copying the structure and data files from another existing website database  
Run these sql statements in the `learnintouch-startup` container, logged into its bash:
```
/usr/local/mariadb/install/bin/mysqldump -h mysql -P 3306 --protocol=tcp -u root -p --default-character-set=latin1 --skip-extended-insert --add-drop-table --no-data db_learnintouch > /usr/local/learnintouch/www/learnintouch.com/account/data/backup/db_learnintouch-structure.sql
/usr/local/mariadb/install/bin/mysqldump -h mysql -P 3306 --protocol=tcp -u root -p --default-character-set=latin1 --skip-extended-insert --no-create-info db_learnintouch > /usr/local/learnintouch/www/learnintouch.com/account/data/backup/db_learnintouch.sql
```
Add the instructions to the `db_learnintouch.sql` file
```
set autocommit = 0;
set unique_checks = 0;
set foreign_key_checks = 0;
commit;
```
Copy the files
```
cp ~/dev/docker/projects/learnintouch/volumes/www.learnintouch/account/data/backup/db_learnintouch-structure.sql .
cp ~/dev/docker/projects/learnintouch/volumes/www.learnintouch/account/data/backup/db_learnintouch.sql .
```
Rebuild the docker image

Doing a dump of the structure
```
docker exec -it learnintouch-startup bash
/usr/local/mariadb/install/bin/mysqldump --protocol=tcp -h mysql -P 3306 -u root -p --default-character-set=latin1 --skip-extended-insert --add-drop-table --no-data db_learnintouch -v > /usr/local/learnintouch/db-structure.sql
docker cp learnintouch-startup:/usr/local/learnintouch/db-structure.sql www.learnintouch/
```

Doing a dump of the data
```
docker exec -it learnintouch-startup bash
/usr/local/mariadb/install/bin/mysqldump --protocol=tcp -h mysql -P 3306 -u root -p --default-character-set=latin1 --skip-extended-insert --no-create-info db_learnintouch -v > /usr/local/learnintouch/db-data.sql
docker cp learnintouch-startup:/usr/local/learnintouch/db-data.sql www.learnintouch/
```
