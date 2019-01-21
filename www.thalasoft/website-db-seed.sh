#!/bin/bash

# Give some time to the MySQL server to start before executing the following scripts
sleep 30s

# Expand the secrets
export DB_ROOT_PASSWORD={{DOCKER-SECRET:DB_ROOT_PASSWORD}}
export WWW_THALASOFT_DB_PASSWORD={{DOCKER-SECRET:WWW_THALASOFT_DB_PASSWORD}}
source /usr/bin/learnintouch/expand-secrets.sh

# Avoid having to provide the user password on the command line
export MYSQL_PWD=$DB_ROOT_PASSWORD

sed -e "s/DB_PASSWORD/$WWW_THALASOFT_DB_PASSWORD/g" < /usr/bin/learnintouch/www/thalasoft.com/db-database.sql > /usr/bin/learnintouch/www/thalasoft.com/db-database-resolved.sql

/usr/bin/mariadb/install/bin/mysql --protocol=tcp -h mysql -P 3306 -u root -v < /usr/bin/learnintouch/www/thalasoft.com/db-database-resolved.sql
/usr/bin/mariadb/install/bin/mysql db_thalasoft --protocol=tcp -h mysql -P 3306 -u root -v < /usr/bin/learnintouch/www/thalasoft.com/db-structure.sql
/usr/bin/mariadb/install/bin/mysql db_thalasoft --protocol=tcp -h mysql -P 3306 -u root -v < /usr/bin/learnintouch/www/thalasoft.com/db-data.sql

chown -R $HOST_USER_ID /usr/bin/mariadb/install/data
chgrp -R $HOST_GROUP_ID /usr/bin/mariadb/install/data

