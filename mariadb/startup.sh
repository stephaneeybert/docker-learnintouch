#!/bin/bash -x

if [ ! -f /usr/bin/mariadb/install/data/ibdata1 ]; then
  chmod 755 /usr/bin/mariadb/install/scripts/mysql_install_db
  sleep 1 # Needed to avoid running the script when this mysql_install_db file has not yet been released by the permissions change
  /usr/bin/mariadb/install/scripts/mysql_install_db \
    --no-defaults \
    --explicit_defaults_for_timestamp \
    --basedir=/usr/bin/mariadb/install \
    --datadir=/usr/bin/mariadb/install/data \
    --tmpdir=/usr/bin/mariadb/install/tmp \
    --lc-messages-dir=/usr/bin/mariadb/install/share

  /usr/bin/mariadb/install/bin/mysqld_safe --defaults-file=/usr/bin/mariadb/install/my.cnf &
  sleep 10s
  echo "grant all on *.* to root@'%' identified by 'root' with grant option; flush privileges;" | /usr/bin/mariadb/install/bin/mysql
  echo "delete from user where User = 'root' and Host != '%'; flush privileges;" | /usr/bin/mariadb/install/bin/mysql
  echo "delete from user where User = ''; flush privileges;" | /usr/bin/mariadb/install/bin/mysql
  tail -f /etc/hosts
else
  /usr/bin/mariadb/install/bin/mysqld_safe --defaults-file=/usr/bin/mariadb/install/my.cnf
fi
