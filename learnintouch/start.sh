#!/bin/bash -x

# Expand the secrets
export DB_ROOT_PASSWORD={{DOCKER-SECRET:DB_ROOT_PASSWORD}}
export LEARNINTOUCH_DB_NAME={{DOCKER-SECRET:LEARNINTOUCH_DB_NAME}}
export LEARNINTOUCH_DB_USER={{DOCKER-SECRET:LEARNINTOUCH_DB_USER}}
export LEARNINTOUCH_DB_PASSWORD={{DOCKER-SECRET:LEARNINTOUCH_DB_PASSWORD}}
export WWW_LEARNINTOUCH_DB_PASSWORD={{DOCKER-SECRET:WWW_LEARNINTOUCH_DB_PASSWORD}}
export WWW_EUROPASPRAK_DB_PASSWORD={{DOCKER-SECRET:WWW_EUROPASPRAK_DB_PASSWORD}}
export WWW_FHS_DB_PASSWORD={{DOCKER-SECRET:WWW_FHS_DB_PASSWORD}}
export WWW_FOLKUNIVERSITET_DB_PASSWORD={{DOCKER-SECRET:WWW_FOLKUNIVERSITET_DB_PASSWORD}}
export WWW_THALASOFT_DB_PASSWORD={{DOCKER-SECRET:WWW_THALASOFT_DB_PASSWORD}}
source /usr/local/learnintouch/expand-secrets.sh

# Avoid having to provide the user password on the command line
export MYSQL_PWD=$DB_ROOT_PASSWORD

export MYSQL_HOME=/usr/local/mariadb/install
export PATH=$PATH:$MYSQL_HOME/bin

# Run a cron job
/usr/local/learnintouch/supercronic-linux-amd64 /usr/local/learnintouch/learnintouch.cron &

# Start the HTTP server
/usr/local/apache/bin/apachectl start && tail -f /dev/null

