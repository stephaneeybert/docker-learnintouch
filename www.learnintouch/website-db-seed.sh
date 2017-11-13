#!/bin/bash -x

sleep 30s

/usr/bin/mysql/install/bin/mysql --protocol=tcp -h mysql -P 3306 -u root -proot -v < /usr/bin/learnintouch/www/learnintouch.com/db-database.sql
/usr/bin/mysql/install/bin/mysql db_learnintouch --protocol=tcp -h mysql -P 3306 -u root -proot -v < /usr/bin/learnintouch/www/learnintouch.com/db-structure.sql
/usr/bin/mysql/install/bin/mysql db_learnintouch --protocol=tcp -h mysql -P 3306 -u root -proot -v < /usr/bin/learnintouch/www/learnintouch.com/db-data.sql
