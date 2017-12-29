#!/bin/bash -x

/usr/bin/mariadb/install/bin/mysql --protocol=tcp -h localhost -u root -e "show databases;" || exit 1
