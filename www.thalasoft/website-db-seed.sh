#!/bin/bash

# Give some time to the MySQL server to start before executing the following scripts
sleep 30s

# Expand the secrets
export DB_ROOT_PASSWORD={{DOCKER-SECRET:DB_ROOT_PASSWORD}}
source /usr/bin/learnintouch/expand-secrets.sh

# Avoid having to provide the user password on the command line
export MYSQL_PWD=$DB_ROOT_PASSWORD

/usr/bin/mariadb/install/bin/mysql --protocol=tcp -h mysql -P 3306 -u root -v < /usr/bin/learnintouch/www/thalasoft.com/db-database.sql
/usr/bin/mariadb/install/bin/mysql db_thalasoft --protocol=tcp -h mysql -P 3306 -u root -v < /usr/bin/learnintouch/www/thalasoft.com/db-structure.sql
/usr/bin/mariadb/install/bin/mysql db_thalasoft --protocol=tcp -h mysql -P 3306 -u root -v < /usr/bin/learnintouch/www/thalasoft.com/db-data.sql
