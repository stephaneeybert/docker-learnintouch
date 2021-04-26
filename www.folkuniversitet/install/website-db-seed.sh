#!/bin/bash

# Give some time to the MySQL server to start before executing the following scripts
sleep 30s

# Expand the secrets
export DB_ROOT_PASSWORD={{DOCKER-SECRET:DB_ROOT_PASSWORD}}
export WWW_FOLKUNIVERSITET_DB_PASSWORD={{DOCKER-SECRET:WWW_FOLKUNIVERSITET_DB_PASSWORD}}
source /usr/local/learnintouch/expand-secrets.sh

# Avoid having to provide the user password on the command line
export MYSQL_PWD=$DB_ROOT_PASSWORD

sed -e "s/DB_PASSWORD/$WWW_FOLKUNIVERSITET_DB_PASSWORD/g" < /usr/local/learnintouch/www/folkuniversitet.europasprak.com/db-database.sql > /usr/local/learnintouch/www/folkuniversitet.europasprak.com/db-database-resolved.sql

/usr/local/mariadb/install/bin/mysql --protocol=tcp -h mysql -P 3306 -u root -v < /usr/local/learnintouch/www/folkuniversitet.europasprak.com/db-database-resolved.sql
/usr/local/mariadb/install/bin/mysql db_folkuniversitet --protocol=tcp -h mysql -P 3306 -u root -v < /usr/local/learnintouch/www/folkuniversitet.europasprak.com/db-structure.sql
/usr/local/mariadb/install/bin/mysql db_folkuniversitet --protocol=tcp -h mysql -P 3306 -u root -v < /usr/local/learnintouch/www/folkuniversitet.europasprak.com/db-data.sql

chown -R $HOST_USER_ID /usr/local/mariadb/install/data
chgrp -R $HOST_GROUP_ID /usr/local/mariadb/install/data
