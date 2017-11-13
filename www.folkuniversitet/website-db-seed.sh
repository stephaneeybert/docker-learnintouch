#!/bin/bash -x

sleep 30s

/usr/bin/mysql/install/bin/mysql --protocol=tcp -h mysql -P 3306 -u root -proot -v < /usr/bin/learnintouch/www/folkuniversitet/db-database.sql
/usr/bin/mysql/install/bin/mysql db_folkuniversitet --protocol=tcp -h mysql -P 3306 -u root -proot -v < /usr/bin/learnintouch/www/folkuniversitet/db-structure.sql
/usr/bin/mysql/install/bin/mysql db_folkuniversitet --protocol=tcp -h mysql -P 3306 -u root -proot -v < /usr/bin/learnintouch/www/folkuniversitet/db-data.sql
