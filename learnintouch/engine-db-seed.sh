#!/bin/bash

# Give some time to the MySQL server to start before executing the following scripts
sleep 30s

# Expand the secrets
export DB_ROOT_PASSWORD={{DOCKER-SECRET:DB_ROOT_PASSWORD}}
source /usr/bin/learnintouch/expand-secrets.sh

# Avoid having to provide the user password on the command line
export MYSQL_PWD=$DB_ROOT_PASSWORD

/usr/bin/mariadb/install/bin/mysql --protocol=tcp -h mysql -P 3306 -u root -v < /usr/bin/learnintouch/db_engine-db.sql
/usr/bin/mariadb/install/bin/mysql db_engine --protocol=tcp -h mysql -P 3306 -u root -v < /usr/bin/learnintouch/db_engine-structure.sql
/usr/bin/mariadb/install/bin/mysql db_engine --protocol=tcp -h mysql -P 3306 -u root -v < /usr/bin/learnintouch/db_engine.sql

