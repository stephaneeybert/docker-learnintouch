#!/bin/bash -x

/usr/bin/mariadb/install/bin/mysql --protocol=tcp -h localhost -u root -proot -e "show databases;" || exit 1
