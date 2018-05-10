#!/bin/bash

# Give some time to the MySQL server to start before executing the following scripts
sleep 30s

# Expand the secrets
export DB_ROOT_PASSWORD={{DOCKER-SECRET:DB_ROOT_PASSWORD}}
export WWW_LEARNINTOUCH_DB_PASSWORD={{DOCKER-SECRET:WWW_LEARNINTOUCH_DB_PASSWORD}}
source /usr/bin/learnintouch/expand-secrets.sh

# Avoid having to provide the user password on the command line
export MYSQL_PWD=$DB_ROOT_PASSWORD

sed -e "s/DB_PASSWORD/$WWW_LEARNINTOUCH_DB_PASSWORD/g" < /usr/bin/learnintouch/www/learnintouch.com/db-database.sql | /usr/bin/mariadb/install/bin/mysql --protocol=tcp -h mysql -P 3306 -u root -v
/usr/bin/mariadb/install/bin/mysql db_learnintouch --protocol=tcp -h mysql -P 3306 -u root -v < /usr/bin/learnintouch/www/learnintouch.com/db-structure.sql
/usr/bin/mariadb/install/bin/mysql db_learnintouch --protocol=tcp -h mysql -P 3306 -u root -v < /usr/bin/learnintouch/www/learnintouch.com/db-data.sql
