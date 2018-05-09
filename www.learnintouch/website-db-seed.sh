#!/bin/bash -x

# Give some time to the MySQL server to start before executing the following scripts
sleep 30s

/usr/bin/mariadb/install/bin/mysql --protocol=tcp -h mysql -P 3306 -u root -proot -v < /usr/bin/learnintouch/www/learnintouch.com/db-database.sql
/usr/bin/mariadb/install/bin/mysql db_learnintouch --protocol=tcp -h mysql -P 3306 -u root -proot -v < /usr/bin/learnintouch/www/learnintouch.com/db-structure.sql
/usr/bin/mariadb/install/bin/mysql db_learnintouch --protocol=tcp -h mysql -P 3306 -u root -proot -v < /usr/bin/learnintouch/www/learnintouch.com/db-data.sql
