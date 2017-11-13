#!/bin/bash -x

sleep 30s

/usr/bin/mysql/install/bin/mysql --protocol=tcp -h mysql -P 3306 -u root -proot -v < /usr/bin/learnintouch/db_engine-db.sql
/usr/bin/mysql/install/bin/mysql db_engine --protocol=tcp -h mysql -P 3306 -u root -proot -v < /usr/bin/learnintouch/db_engine-structure.sql
/usr/bin/mysql/install/bin/mysql db_engine --protocol=tcp -h mysql -P 3306 -u root -proot -v < /usr/bin/learnintouch/db_engine.sql

